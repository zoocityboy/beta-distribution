help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-21s\033[0m %s\n", $$1, $$2}'

setup-venv: ## Setup a local venv
	python3.12 -m venv .venv && . .venv/bin/activate
	

install-deps: ## Install python dependencies for development
	pip install -r requirements.txt -r requirements-dev.txt

start: ## Start a production like server
	uvicorn --host=0.0.0.0 --port=8000 beta_distribution.app:app

start-ssl: ## Start a production like server
	uvicorn --host=0.0.0.0 --port=8000 --ssl-keyfile ./cert/key.pem --ssl-certfile ./cert/cert.pem beta_distribution.app:app

dev: ## Start the local developent server
	uvicorn --host=0.0.0.0 --port=8000 beta_distribution.app:app --reload

dev-debug: ## Start the local development server with debug logging
	PYTHONPATH=. LOG_LEVEL=DEBUG uvicorn --host=0.0.0.0 --port=8000 beta_distribution.app:app --reload --log-level debug

lint: ## Lint the code according to the standards
	ruff check .
	ruff format --check .
	pyright .

format: ## Format the code according to the standards
	ruff check --fix .
	ruff format .

lock-deps: ## Lock dependencies to requirements.txt
	pip-compile --strip-extras requirements-dev.in > requirements-dev.txt
	pip-compile --strip-extras requirements.in > requirements.txt
