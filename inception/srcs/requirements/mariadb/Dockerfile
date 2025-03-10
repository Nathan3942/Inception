FROM	debian:bullseye-slim

RUN	apt-get update && \
	apt-get install -y --no-install-recommends mariadb-server tini && \
	rm -rf /var/lib/apt/lists/*

RUN	mkdir -p /docker-entrypoint-initdb.d

COPY	./conf/my.cnf /etc/mysql/my.cnf
#COPY	./conf/init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE	3306

USER	mysql

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD	["mysqld"]

