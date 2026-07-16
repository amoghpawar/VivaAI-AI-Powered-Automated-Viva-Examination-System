# 🎓 VivaAI — AI-Powered Automated Viva Examination System

[![Live Demo](https://img.shields.io/badge/demo-live-brightgreen)](https://vivaai-amogh.vercel.app)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.10%2B-blue)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/flask-2.x-black)](https://flask.palletsprojects.com/)
[![PostgreSQL](https://img.shields.io/badge/database-PostgreSQL-336791)](https://www.postgresql.org/)

**VivaAI** is a web-based, AI-powered viva (oral exam) simulation system. It evaluates free-text student answers using NLP techniques — TF-IDF vectorization and cosine similarity — and adapts question difficulty in real time based on performance, similar to how a real examiner probes deeper on strong answers and eases up on weak ones.

**What makes it different:** unlike a static quiz app, VivaAI evaluates *how you phrase* your answer using NLP similarity scoring — not just whether you picked the right option — and dynamically adjusts question difficulty in real time, the way a real examiner would.

🔗 **Live Demo:** [vivaai-amogh.vercel.app](https://vivaai-amogh.vercel.app)

---

## ✨ Features

- **Multi-subject question bank** — Machine Learning, DBMS, OOP, and Operating Systems, spanning Easy/Medium/Hard difficulty
- **Adaptive difficulty engine** — the next question's difficulty is chosen based on how well the previous one was answered (Strong → harder, Weak → easier, retry)
- **NLP-based answer evaluation** — combines TF-IDF cosine similarity (60%) with domain-aware keyword overlap (40%) and a synonym-expansion layer to handle vocabulary variation between student phrasing and ideal answers
- **Smart contextual hints** — topic- and difficulty-specific hints, with an automatic score penalty applied if a hint is used
- **Session-based performance report** — Strong / Average / Weak breakdown per question, with topic-level study recommendations at the end of each session
- **Voice input support** — answer questions via the Web Speech API instead of typing

---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Backend | Python, Flask |
| Database | PostgreSQL (hosted on [Supabase](https://supabase.com)) |
| AI / NLP Engine | scikit-learn (TF-IDF, cosine similarity) |
| Frontend | HTML, CSS, JavaScript, Web Speech API |
| Deployment | Vercel |

---

## 🚀 How to Use

**Easiest way — just try the live demo:**

1. Open [vivaai-amogh.vercel.app](https://vivaai-amogh.vercel.app)
2. Click **Sign Up** and create an account
3. Log in, pick a subject (ML, DBMS, OOP, or OS)
4. Answer each question — type it out or use the mic icon to speak your answer
5. Use **Hint** if you're stuck (small score penalty applies)
6. After 5 questions, view your performance report with topic-wise study recommendations

**To run it on your own computer instead:**

```bash
git clone https://github.com/amoghpawar/VivaAI-AI-Powered-Automated-Viva-Examination-System.git
cd VivaAI-AI-Powered-Automated-Viva-Examination-System
pip install -r requirements.txt
```

Create a `.env` file in the project folder:
```env
DATABASE_URL=postgresql://<user>:<password>@<host>:<port>/postgres
SECRET_KEY=<any-random-string>
```

Set up the database by running `vivaai_complete.sql` against your PostgreSQL instance, then start the app:
```bash
python app.py
```

Open `http://localhost:5000` in your browser.

---

## 📁 Project Structure

```
├── app.py                 # Flask application, routes, and API logic
├── ai_engine.py            # NLP answer evaluation (TF-IDF + keyword overlap)
├── vivaai_complete.sql     # Database schema and seed question data
├── requirements.txt
├── templates/               # HTML pages — login, subject selection, viva interface
├── static/                  # Frontend JS/CSS and voice input logic
└── README.md
```

---

## ⚙️ How It Works

1. Student signs up / logs in
2. Student selects a subject (ML, DBMS, OOP, or OS)
3. The system serves an **Easy** question first
4. Student answers — typed or via voice
5. `ai_engine.py` scores the answer against the ideal answer, classifying it as **Strong**, **Average**, or **Weak**
6. The next question's difficulty adapts: Weak → retry the same topic at Easy, Average → same topic at Medium, Strong → a new topic at Hard
7. After 5 questions, a performance report is generated with per-question breakdown and topic-level study recommendations

---

## 📸 Screenshots

<img width="1918" height="910" alt="VivaAI Performance Report" src="https://github.com/user-attachments/assets/43502665-9ce5-49eb-8e6a-ffb72b3a8c69" />
<img width="1911" height="911" alt="VivaAI Login Page" src="https://github.com/user-attachments/assets/7a5bde55-9441-4cba-a037-b03f9098b257" />
<img width="1077" height="701" alt="VivaAI Answer Classification" src="https://github.com/user-attachments/assets/1bc63b59-d288-45ec-857c-47f6780d2b1e" />

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.
