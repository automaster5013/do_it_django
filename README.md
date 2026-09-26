# Do It Django

A Django learning project that combines a blog, static portfolio pages, authentication, Bootstrap templates, PostgreSQL, and a Docker Compose development environment.

This repository is intended for local study. Its development server and example database credentials are not production deployment settings.

## Features

- Blog post list, detail, create, and update views
- Categories, tags, search, and comments
- Landing and About Me pages
- Django admin and django-allauth account routes
- Bootstrap 4 forms and templates
- PostgreSQL-backed Docker Compose environment

## Project structure

```text
blog/                 Blog models, views, forms, URLs, templates, and static assets
single_pages/         Landing and About Me pages
do_it_django_prj/     Django settings and root URL configuration
docker-compose.yml    Local web and PostgreSQL services
Dockerfile            Python 3.12 development image
```

## Quick start with Docker

Requirements: Docker Desktop and Docker Compose v2.

Create the ignored development environment file from the committed template:

```powershell
Copy-Item .env.dev.example .env.dev
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

Paste the generated value after `SECRET_KEY=` in `.env.dev`. Do not commit `.env.dev`.

Start the application and database:

```powershell
docker compose up --build
```

Open `http://localhost:8000/`. The blog is available at `/blog/`, accounts at `/accounts/`, and Django admin at `/admin/`.

Create an administrator when needed:

```powershell
docker compose exec web python manage.py createsuperuser
```

Stop the containers while preserving the PostgreSQL volume:

```powershell
docker compose down
```

`docker compose down -v` also removes the local database volume and its data.

## Run without Docker

Create and activate a Python 3.12 virtual environment, install dependencies, and provide a secret key:

```powershell
python -m venv .venv
./.venv/Scripts/Activate.ps1
pip install -r requirements.txt
$env:SECRET_KEY = python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
python manage.py migrate
python manage.py runserver
```

Without the `SQL_*` variables, Django uses a local SQLite database. `DEBUG` defaults to disabled and `SECRET_KEY` is always required.

## Verification

Run Django's system checks and tests before submitting a change:

```powershell
python manage.py check
python manage.py test
```

For the Compose environment:

```powershell
docker compose config
docker compose exec web python manage.py check
docker compose exec web python manage.py test
```

GitHub Actions runs the source compilation, Django system check, and test suite with Python 3.12 for every pull request and push to `main`.

## Configuration and safety

- `.env.dev` is ignored; only `.env.dev.example` belongs in Git.
- `.dockerignore` keeps local environment files, Git metadata, virtual environments, caches, SQLite data, and uploaded media out of the image build context.
- Generate a unique `SECRET_KEY` for every environment. The application fails to start when it is missing.
- The database credentials in the example and Compose file are local development defaults only.
- Set `DEBUG=0`, use an explicit `DJANGO_ALLOWED_HOSTS` list, and follow Django's deployment checklist before any external deployment.
- Do not commit account credentials, OAuth secrets, real personal data, database exports, or production configuration.

## Current scope

The project has minimal placeholder test modules and no production web server, static-file pipeline, TLS termination, or deployment manifest. Treat it as a learning baseline rather than an internet-facing service.
