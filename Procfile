web: gunicorn portfolio_project.wsgi:application --bind 0.0.0.0:$PORT --workers=3
release:
  command:
    - python -m pip install --upgrade pip
    - pip install -r requirements.txt
    - python manage.py collectstatic --noinput
    - python manage.py migrate
