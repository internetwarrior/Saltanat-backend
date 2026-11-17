
FROM python:3.12-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD sh -c "python manage.py makemigrations && \
          python manage.py migrate && \
          python manage.py shell -c \"from django.contrib.auth import get_user_model; User = get_user_model(); u, created = User.objects.get_or_create(username='admin', defaults={'email': 'admin@gmail.com'}); u.email = 'admin@gmail.com'; u.is_staff = True; u.is_superuser = True; u.set_password('admin'); u.save()\" && \
          python manage.py runserver 0.0.0.0:8000"