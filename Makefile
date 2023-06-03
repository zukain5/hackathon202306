.PHONY: init
init:
	docker compose build
	docker compose run --rm web rails db:create
	docker compose run --rm web rails db:migrate
	docker compose run --rm web rails db:fixtures:load

.PHONY: up
up:
	docker compose up

.PHONY: up_m1
up_m1:
	docker compose -f docker-compose.yml -f m1mac.yml up

.PHONY: bash
bash:
	docker compose run --rm web /bin/bash

.PHONY: rails_console
rails_console:
	docker compose run --rm web rails console

.PHONY: db_migrate
db_migrate:
	docker compose run --rm web rails db:migrate
