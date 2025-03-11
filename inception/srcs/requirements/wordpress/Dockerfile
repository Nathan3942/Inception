FROM	debian:bullseye-slim

RUN	apt-get update && \
   	apt-get install -y --no-install-recommends \
        php-fpm php-mysql wget curl tar ca-certificates tini && \
   	rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN	curl -fsSL -O https://wordpress.org/latest.tar.gz && \
   	tar -xvzf latest.tar.gz --strip-components=1 && \
   	rm latest.tar.gz

RUN	sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|" /etc/php/7.4/fpm/pool.d/www.conf


RUN	mkdir -p /run/php

RUN	echo "<?php phpinfo(); ?>" > /var/www/html/info.php

EXPOSE	9000

CMD	["php-fpm7.4", "-F"]

