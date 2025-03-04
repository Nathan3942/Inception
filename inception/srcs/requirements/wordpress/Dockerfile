FROM	debian:bullseye-slim

RUN	apt-get update && \
   	apt-get install -y --no-install-recommends \
        php-fpm php-mysql wget curl tar ca-certificates tini && \
   	rm -rf /var/lib/apt/lists/*

#RUN	mkdir -p /var/log/php && \
	#chown -R www-data:www-data /var/log/php

WORKDIR /var/www/html

RUN	curl -fsSL -O https://wordpress.org/latest.tar.gz && \
   	tar -xvzf latest.tar.gz --strip-components=1 && \
   	rm latest.tar.gz

RUN mkdir -p /run/php

EXPOSE	9000

CMD	["php-fpm7.4", "-F"]

