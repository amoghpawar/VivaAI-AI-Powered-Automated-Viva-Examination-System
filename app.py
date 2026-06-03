import time
from flask import Flask, request, jsonify, render_template, session, redirect
from werkzeug.security import generate_password_hash, check_password_hash
from ai_engine import evaluate_answer
import mysql.connector
import re

app = Flask(__name__)
app.secret_key = "vivaai_2024_secret"

def get_db():
    try:
        return mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database="vivaai"
        )
    except mysql.connector.Error as e:
        raise ConnectionError(f"Database connection failed: {str(e)}")

# Smart hints based on question topic and difficulty
HINTS = {
    # ML
    "Intro":          "AI branch + learns patterns from data + makes predictions without explicit programming",
    "Types":          "Supervised = labeled data | Unsupervised = unlabeled data | Reinforcement = reward based learning",
    "Dataset":        "Structured collection of data + has features and labels + used to train and test models",
    "Prediction":     "Trained model + new input data + estimates output like class or number",
    "Overfitting":    "Model memorizes training data + learns noise + fails on new unseen data",
    "Underfitting":   "Model too simple + misses patterns + poor performance on both train and test",
    "Regression":     "Predicts continuous values + like price or temperature + linear regression is simplest",
    "Classification": "Predicts categories or classes + like spam or not spam + uses labeled training data",
    "NN":             "Brain inspired model + input hidden output layers + learns using weights and backpropagation",
    "DL":             "Many layered neural network + auto feature learning + needs large data and compute power",
    "GD":             "Optimization algorithm + minimizes loss function + updates weights opposite to gradient",
    # DBMS
    "Keys":           "Primary key = unique + not null | Foreign key = links two tables + referential integrity",
    "SQL":            "Structured Query Language + used to create retrieve update delete data in relational databases",
    "Tables":         "Stores data in rows and columns + table is physical + view is virtual based on query",
    "Normalization":  "Removes redundancy + organizes tables + follows 1NF 2NF 3NF rules for data integrity",
    "Joins":          "Combines rows from two tables + based on common column + types INNER LEFT RIGHT FULL",
    "Indexing":       "Speeds up data retrieval + separate pointer structure + like a book index for rows",
    "Transactions":   "Group of operations as one unit + ACID = Atomicity Consistency Isolation Durability",
    "ER Model":       "Entities = real world objects + Attributes = properties + Relationships = how entities connect",
    "Views":          "Virtual table + based on SELECT query + does not store data + simplifies complex queries",
    "Triggers":       "Auto executes on INSERT UPDATE DELETE + used for audit logs + enforces business rules",
    "Concurrency":    "Multiple users access same data + problems are dirty read lost update + solved by locking",
    "Stored Proc":    "Precompiled SQL block + stored in database + called by name + faster than raw queries",
}

DIFFICULTY_HINTS = {
    "Easy":   "| Level: Basic definition",
    "Medium": "| Level: Include real world example",
    "Hard":   "| Level: Explain working + tradeoffs",
}

# ─── PAGES ────────────────────────────────────────────
@app.route("/")
def index():
    if "student_id" not in session:
        return redirect("/login")
    return redirect("/subject")

@app.route("/login")
def login_page():
    return render_template("login.html")

@app.route("/subject")
def subject_page():
    if "student_id" not in session:
        return redirect("/login")
    return render_template("subject.html", name=session["student_name"])

@app.route("/viva")
def viva_page():
    if "student_id" not in session:
        return redirect("/login")
    if "subject" not in session:
        return redirect("/subject")
    return render_template("index.html")

# ─── AUTH ─────────────────────────────────────────────
@app.route("/api/login", methods=["POST"])
def login():
    data = request.get_json()
    if not data:
        return jsonify({"success": False, "message": "Invalid request."})
    email = data.get("email", "").strip()
    password = data.get("password", "").strip()
    try:
        db = get_db()
        cursor = db.cursor(dictionary=True)
        cursor.execute("SELECT * FROM students WHERE email=%s", (email,))
        student = cursor.fetchone()
        db.close()
        if student and check_password_hash(student["password"], password):
            session.clear()
            session["student_id"] = int(student["id"])
            session["student_name"] = student["name"]
            session.modified = True
            return jsonify({"success": True})
        return jsonify({"success": False, "message": "Invalid email or password."})
    except Exception as e:
        return jsonify({"success": False, "message": "Database error: " + str(e)})

@app.route("/api/signup", methods=["POST"])
def signup():
    data = request.get_json()
    name = data.get("name", "").strip()
    email = data.get("email", "").strip()
    password = data.get("password", "").strip()
    if not name or not email or not password:
        return jsonify({"success": False, "message": "All fields are required."})
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT id FROM students WHERE email=%s", (email,))
    existing = cursor.fetchone()
    if existing:
        db.close()
        return jsonify({"success": False, "message": "Email already registered. Please login."})
    cursor.execute("INSERT INTO students (name, email, password) VALUES (%s, %s, %s)",
               (name, email, generate_password_hash(password)))
    db.commit()
    db.close()
    return jsonify({"success": True})

@app.route("/api/results", methods=["GET"])
def get_results():
    student_id = session.get("student_id")
    if not student_id:
        return jsonify({"success": False, "message": "Not logged in."})
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("""
        SELECT q.topic, q.difficulty, a.classification, a.score
        FROM answers a
        JOIN questions q ON a.question_id = q.id
        WHERE a.student_id = %s
        ORDER BY a.submitted_at DESC
        LIMIT 10
    """, (student_id,))
    results = cursor.fetchall()
    db.close()
    return jsonify({"success": True, "results": results})

@app.route("/api/logout")
def logout():
    session.clear()
    return redirect("/login")

@app.route("/api/set_subject", methods=["POST"])
def set_subject():
    data = request.get_json()
    session["subject"] = data["subject"]
    return jsonify({"success": True})

# ─── QUESTIONS ────────────────────────────────────────
@app.route("/question", methods=["GET"])
def get_question():
    subject = session.get("subject", "ML")
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("""SELECT * FROM questions WHERE subject=%s AND difficulty='Easy'
                      ORDER BY RAND() LIMIT 1""", (subject,))
    q = cursor.fetchone()
    db.close()
    return jsonify(q)

@app.route("/hint", methods=["POST"])
def get_hint():
    data = request.get_json()
    qid = data.get("question_id")
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT topic, difficulty FROM questions WHERE id=%s", (qid,))
    row = cursor.fetchone()
    db.close()

    if not row:
        return jsonify({"hint": "Think about the definition, a real world example, and how it works."})

    topic_hint = HINTS.get(row["topic"], "Key concept → think about definition → real world example → how it works")
    diff_hint = DIFFICULTY_HINTS.get(row["difficulty"], "")

    hint = topic_hint + " " + diff_hint
    return jsonify({"hint": hint})

@app.route("/submit_answer", methods=["POST"])
def submit_answer():
    # Rate limiting — max 1 submission per 2 seconds per student
    last_submit = session.get("last_submit_time", 0)
    current_time = time.time()
    if current_time - last_submit < 2:
        return jsonify({"success": False, "message": "Please wait before submitting again."}), 429
    session["last_submit_time"] = current_time

    data = request.get_json()
    student_answer = data.get("answer", "")
    student_answer = re.sub(r'<[^>]+>', '', student_answer)  # strip HTML tags
    student_answer = student_answer.strip()[:2000]  # limit to 2000 chars
    qid = data.get("question_id")
    hint_used = data.get("hint_used", False)
    subject = session.get("subject", "ML")
    student_id = session.get("student_id", 1)

    db = get_db()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT ideal_answer, topic, difficulty FROM questions WHERE id=%s", (qid,))
    row = cursor.fetchone()

    score, classification = evaluate_answer(student_answer, row["ideal_answer"])

    if hint_used:
        score = round(max(0, score - 0.10), 4)
        if score >= 0.35:
            classification = "Strong"
        elif score >= 0.15:
            classification = "Average"
        else:
            classification = "Weak"

    weak_flag = 1 if classification == "Weak" else 0

    cursor.execute("""
        INSERT INTO answers (student_id, question_id, student_answer, score, classification, weak_topic_flag)
        VALUES (%s, %s, %s, %s, %s, %s)
    """, (student_id, qid, student_answer, score, classification, weak_flag))
    db.commit()

    if classification == "Weak":
        cursor.execute("""SELECT * FROM questions WHERE subject=%s AND topic=%s AND difficulty='Easy' AND id!=%s
                          ORDER BY RAND() LIMIT 1""", (subject, row["topic"], qid))
    elif classification == "Average":
        cursor.execute("""SELECT * FROM questions WHERE subject=%s AND topic=%s AND difficulty='Medium' AND id!=%s
                          ORDER BY RAND() LIMIT 1""", (subject, row["topic"], qid))
    else:
        cursor.execute("""SELECT * FROM questions WHERE subject=%s AND topic!=%s AND difficulty='Hard' AND id!=%s
                          ORDER BY RAND() LIMIT 1""", (subject, row["topic"], qid))

    next_q = cursor.fetchone()
    if not next_q:
        cursor.execute("SELECT * FROM questions WHERE subject=%s AND id!=%s ORDER BY RAND() LIMIT 1",
                       (subject, qid))
        next_q = cursor.fetchone()

    db.close()
    return jsonify({
        "score": score,
        "classification": classification,
        "next_question": next_q
    })

if __name__ == "__main__":
    app.run(debug=True)
 
@app.errorhandler(ConnectionError)
def db_connection_error(e):
    return jsonify({"success": False, "message": "Service temporarily unavailable. Please try again later."}), 503