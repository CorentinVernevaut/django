.PHONY: help
help: ## Show this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: migrate
migrate: ## Synchronizes the database state with the current set of models and migrations.
	docker-compose run --rm web python manage.py migrate

.PHONY: makemigrations
makemigrations: ## Create changes models in migrations.
	docker-compose run --rm web python manage.py makemigrations polls

sqlmigrate : ## Prints the SQL for the named migration
	docker-compose run --rm web python manage.py sqlmigrate polls 0001

check : ## Checks for any problems in your project
	docker-compose run --rm web python manage.py check

shell : ## Invoke the python shell
	docker-compose run --rm web python manage.py shell

superUser : ## Create super user
	docker-compose run --rm web python manage.py createsuperuser

tests : ## Running tests
	docker-compose run --rm web python manage.py test polls