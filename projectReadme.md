# 📘 Demo Django Project With PostgreSQL

This project demonstrates how to connect a Django app with a PostgreSQL database using Docker or a local setup.

---

## 🔧 Prerequisites

* Python 3.10 (recommended)
* Git
* Docker Desktop (for PostgreSQL) or docker/docker compose setup
* Virtual Environment support (`venv`)
* Pip
* K8s

---

## 📁 Clone the Repository

```bash
git clone <your-repo-url>
cd <project-folder>
```

---

## 🐍 Create Virtual Environment

> Pillow used in this project requires Python 3.10 or below.

### Windows

```bash
py -3.10 -m venv venv
.\venv\Scripts\activate
```

### Linux/Mac

```bash
python3.10 -m venv venv
source venv/bin/activate
```

---

## 📦 Install Requirements

```bash
pip install -r requirements.txt
```

---

## ⚙️ Setup Configuration

Create a file at `./core/settings.ini` with the following content:

```ini
[settings]
DEBUG=True
SECRET_KEY=j_ix0g%%7i=jfx7q(!g@)@%%a9no-w2l8vmyf=ef$jnc-sk)3sd4
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_HOST_USER=habot.test@gmail.com
EMAIL_HOST_PASSWORD=some-password
EMAIL_USE_TLS=True
DEFAULT_FROM_EMAIL=habot.test@gmail.com
```

---

## 🐘 Setup PostgreSQL (Using Docker)

### 1. Open Docker Desktop

### 2. Pull Official Postgres Image

```bash
docker pull postgres
```

### 3. Run Container

Run from Docker UI or via CLI:

```bash
docker run --name postgres \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_USER=user \
  -e POSTGRES_DB=tododb \
  -p 5432:5432 \
  -d postgres
```

Environment Variables:

* `POSTGRES_USER=user`
* `POSTGRES_PASSWORD=password`
* `POSTGRES_DB=tododb`

---

## ⚙️ Configure Django Database Settings

Make sure your Django settings point to these environment variables or match them:

```env [ setup in django app default to connect ]
DB_NAME=tododb
DB_USER=user
DB_PASSWORD=password
DB_PORT=5432
DB_HOST=localhost
```

---

## 🚀 Run the Project

```bash
python manage.py migrate     # Apply migrations
python manage.py runserver   # Start development server
```

Visit: [http://127.0.0.1:8000](http://127.0.0.1:8000)

---

































