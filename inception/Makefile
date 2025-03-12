NAME = inception

build:
	sudo docker-compose -f srcs/docker-compose.yml build

buildnocache:
	sudo docker-compose -f srcs/docker-compose.yml build --no-cache

up:
	#sudo mkdir /home/njeanbou/data/mariadb_data
	#sudo mkdir /home/njeanbou/data/wordpress_data
	sudo docker-compose -f srcs/docker-compose.yml up -d

down:
	sudo docker-compose -f srcs/docker-compose.yml down -v

re: down up

logs:
	sudo docker-compose -f srcs/docker-compose.yml logs -f

clean:
	sudo docker-compose -f srcs/docker-compose.yml down -v --volumes --remove-orphans
	#sudo rm -rf /home/njeanbou/data/wordpress_data/
	#sudo rm -rf /home/njeanbou/data/mariadb_data/

