all: up

User=hlahwaou


.PHONY = down clean stop up status


up:
	docker compose -f ./srcs/docker-compose.yml up -d --build


stop:
	docker compose -f ./srcs/docker-compose.yml stop



down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	sudo rm -rf /home/$(User)/data/wp/*
	sudo rm -rf /home/$(User)/dat/db/*
	

status:
	docker ps
