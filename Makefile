#
PROJECT_NAME=frontend

# Compose files
DEV_COMPOSE=docker-compose.dev.yml
PROD_COMPOSE=docker-compose.yml

# Base commands
dev:
	docker-compose -p $(PROJECT_NAME) -f $(DEV_COMPOSE) up --build

dev-angular:
	docker-compose -p $(PROJECT_NAME) -f frontend-angular/$(DEV_COMPOSE) up --build

dev-node:
	docker-compose -p $(PROJECT_NAME) -f backend-node/$(DEV_COMPOSE) up --build

prod:
	docker-compose -p $(PROJECT_NAME) -f $(PROD_COMPOSE) up --build -d

stop:
	docker-compose -p $(PROJECT_NAME) -f $(DEV_COMPOSE) down
	docker-compose -p $(PROJECT_NAME) -f $(PROD_COMPOSE) down
	docker-compose -p $(PROJECT_NAME) -f frontend-angular/$(DEV_COMPOSE) down
	docker-compose -p $(PROJECT_NAME) -f backend-node/$(DEV_COMPOSE) down

clean:
	docker-compose -p $(PROJECT_NAME) -f $(DEV_COMPOSE) down --volumes --remove-orphans
	docker-compose -p $(PROJECT_NAME) -f $(PROD_COMPOSE) down --volumes --remove-orphans
