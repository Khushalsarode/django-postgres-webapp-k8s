# 📘 Demo Django Project With PostgreSQL

This project demonstrates how to connect a Django app with a PostgreSQL database using K8S Minikube local setup with ingress.

---

## 🔧 Prerequisites

* Python 3.10 (recommended)
* Git
* Docker Desktop (for PostgreSQL) or docker/docker compose setup
* Virtual Environment support (`venv`)
* Pip
* K8s - minikube

---

## 📁 Clone the Repository

```bash
git clone https://github.com/Khushalsarode/django-postgres-webapp-k8s.git
cd django-postgres-webapp-k8s
```

---

## 🐍 Create Virtual Environment

> Pillow used in this project requires Python 3.10 or below.

### Windows

```bash
py -3.10 -m venv venv
.\venv\Scripts\activate.bat
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

## creating docker file for containerization of django app
[Dockerfile](./Dockerfile)

## now create an docker compose file to test the application running fine
[docker-compose.yaml](./django-postgres.yaml)

## Runing the compose application
- To start the service
```bash
docker-compose -f django-postgres.yaml up
```
- To Stop the service
```bash
docker-compose down
```

## Setting up an local K8s cluster using minikube
> [!note]
> All the instruction should be run in administrator role using powershell 
- To install and setup follow the below guide
[setup minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download)

- After installation complete check 
```bash
minikube
```
- start the minikube
```bash
minikube start
```
- This will take some time
- As minikube is set add ingress add on in minikube
``` bash
minikube addons enable ingress
```
- All the yaml files needed for cluster are under [folder](./k8s/)
- To apply all files
```bash
kubectl apply -f ./k8s/
```
- To check the deployments & services, Ingress
```bash
kubectl get all
```
- To check logs
```bash
kubectl logs <pod-id>
```
- To access app outside on browser
```bash
minikube tunnel
```
- To access app on browser
```bash
http://demo.local
```

- To map this on local system need to add into local system DNS
- open this file in notepad administrator mode
``` bash
path: C:\Windows\System32\drivers\etc\hosts
scroll at last and add:
127.0.0.1 demo.local
```

- To automate the build and push of dockerfile, added the github action workflow which make all the process seamless and optimized.
[workflow](.github/workflows/docker-publish.yml)



























