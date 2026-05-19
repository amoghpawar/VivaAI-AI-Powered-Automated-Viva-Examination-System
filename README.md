# VivaAI — AI-Powered Automated Viva Examination System

## Overview
VivaAI is a web-based viva examination system that uses NLP to evaluate student answers automatically. Students are asked questions based on their chosen subject and difficulty adapts based on their performance.

## Features
- Subject selection — ML and DBMS
- Adaptive difficulty — Easy, Medium, Hard based on previous answer
- AI-powered answer evaluation using cosine similarity and NLP
- Smart hints system with topic-specific guidance
- Session-based scoring and classification — Strong, Average, Weak
- Voice input support via Web Speech API

## Tech Stack
- Backend — Python, Flask
- Database — MySQL
- AI Engine — scikit-learn, NLTK, sentence transformers
- Frontend — HTML, CSS, JavaScript

## How to Run
1. Clone the repository
2. Install dependencies
   pip install -r requirements.txt
3. Set up MySQL database
   mysql -u root -p < vivaai_complete.sql
4. Run the Flask app
   python app.py
5. Open browser and go to http://localhost:5000

## Project Structure
- app.py — Main Flask application and API routes
- ai_engine.py — Answer evaluation using NLP and cosine similarity
- templates/ — HTML pages for login, subject selection, and viva
- static/ — JavaScript for frontend logic and voice input
- vivaai_complete.sql — MySQL database schema and sample questions

## How It Works
1. Student logs in and selects a subject
2. System serves an Easy question first
3. Student answers — typed or via voice
4. AI engine evaluates the answer and classifies it as Strong, Average, or Weak
5. Next question difficulty adapts based on classification
6. Session ends after 5 questions with a performance summary

## Screenshots
<img width="1918" height="910" alt="REPORT" src="https://github.com/user-attachments/assets/43502665-9ce5-49eb-8e6a-ffb72b3a8c69" />
<img width="1911" height="911" alt="LOGIN PAGE" src="https://github.com/user-attachments/assets/7a5bde55-9441-4cba-a037-b03f9098b257" />
<img width="1077" height="701" alt="ANS CLASSIFICATION" src="https://github.com/user-attachments/assets/1bc63b59-d288-45ec-857c-47f6780d2b1e" />




## License
MIT License — see LICENSE file
