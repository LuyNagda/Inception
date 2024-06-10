all : up

up : 
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb
	@docker compose -f ./srcs/docker-compose.yaml up -d

down : 
	@docker compose -f ./srcs/docker-compose.yaml down
	sudo rm -rf ~/data

stop : 
	@docker compose -f ./srcs/docker-compose.yaml stop

start : 
	@docker compose -f ./srcs/docker-compose.yaml start

status : 
	@docker ps

re: down up

build:
	@docker compose -f ./srcs/docker-compose.yaml up --build -d