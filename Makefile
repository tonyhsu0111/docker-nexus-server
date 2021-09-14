all: help

CONTAINER_NAME=nexus-server

help:
	@echo ""
	@echo "CONTAINER_NAME=$(CONTAINER_NAME)"
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build        - build container"
	@echo "   2. make start        - start container"
	@echo "   3. make stop         - stop container"
	@echo "   4. make logs         - view logs"
	@echo "   5. make bash         - bash"
	@echo "   6. make clean        - remove image and unused docker data"

build:
	@echo "Building $(CONTAINER_NAME) container..."
	@docker-compose down 
	@docker-compose build --force-rm

run:
	@echo "Starting $(CONTAINER_NAME) container..."
	@docker-compose down
	@docker-compose up -d
	@echo "Please be patient. This could take a while..."
	@echo "Type 'make logs' for the logs"

rm:
	@echo "Stopping container..."
	@docker-compose down

bash:
	@docker-compose exec $(CONTAINER_NAME) bash

logs:
	@docker-compose logs --tail 25 -f 

clean:
	@docker-compose down --rmi local
	@docker system prune -f
