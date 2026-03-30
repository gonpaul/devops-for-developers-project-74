.PHONY: test ci up down clear logs build

test:
	docker compose -f docker-compose.yml up --build --abort-on-container-exit

ci: test

up:
	docker compose up --build

down:
	docker compose down

clear:
	docker compose down -v --rmi local
	rm -rf app

logs:
	docker compose logs -f

build:
	docker compose -f docker-compose.prod.yml build app

push:
	docker compose -f docker-compose.prod.yml push app