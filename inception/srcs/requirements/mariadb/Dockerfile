FROM	debian:bullseye-slim

RUN	apt-get update && \
	apt-get install -y --no-install-recommends mariadb-server tini && \
	rm -rf /var/lib/apt/lists/*

COPY	./conf/my.cnf /tmp/mysql/my.cnf

EXPOSE	3306

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD	["mysqld"]

