NAME = inception

build:
	sudo docker compose -f srcs/docker-compose.yml build

up:
	sudo docker compose -f srcs/docker-compose.yml up -d

down:
	sudo docker compose -f srcs/docker-compose.yml down

re: down up

logs:
	sudo docker compose -f srcs/docker-compose.yml logs -f

clean:
	sudo docker compose -f srcs/docker-compose.yml down --volumes --remove-orphans

