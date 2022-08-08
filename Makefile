build:
	docker compose -f .\local.yml up --build -d --remove-orphans

up:
	docker compose -f local.yml up -d

down:
	docker compose -f local.yml down

show_logs:
	docker compose -f local.yml logs

migrate:
	docker compose -f local.yml run --rm api python manage.py migrate

makemigrations:
	docker compose -f local.yml run --rm api python manage.py makemigrations

collectstatic:
	docker compose -f local.yml run --rm api python manage.py collectstatic --no-input --clear

superuser:
	docker compose -f local.yml run --rm api python manage.py createsuperuser

down-v:
	docker compose -f local.yml down -v

volume:
	docker volume inspect authors-src_local_postgres_data

backup:
	docker compose -f local.yml exec postgres backup

backups:
	docker compose -f local.yml exec postgres backups

upu-smurd-db:
	docker compose -f local.yml exec postgres psql --username=iosifs --dbname=upu-smurd-cluj

flake8:
	docker compose -f local.yml exec api flake8 .

black-check:
	docker compose -f local.yml exec api black --check --exclude=migrations .

black-diff:
	docker compose -f local.yml exec api black --diff --exclude=migrations .

black:
	docker compose -f local.yml exec api black --exclude=migrations .

isort-check:
	docker compose -f local.yml exec api isort . --check-only --skip env --skip migrations 

isort-diff:
	docker compose -f local.yml exec api isort . --diff --skip env --skip migrations

isort:
	docker compose -f local.yml exec api isort . --skip env --skip migrations
	
rebuild_index:
	docker compose -f local.yml run --rm api python manage.py rebuild_index
	
pytest-cov:
	pytest --cov=. --cov-report html

check-deploy:
	docker compose -f local.yml run --rm api python manage.py check --deploy