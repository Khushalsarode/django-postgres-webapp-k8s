FROM python:3.10-slim 
#Using Image
#set env variable
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

#workdir
WORKDIR /app

#install dependencies
RUN apt-get update && apt-get install -y \
   libpq-dev \
   gcc \
   && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY ./requirements.txt .
RUN pip install --no-cache-dir  --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

#collect static file
RUN python manage.py collectstatic --noinput || true

#expose service
EXPOSE 8000

#Run app
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
