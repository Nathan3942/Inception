FROM	debian:bullseye-slim

RUN	apt-get update && \
	apt-get install -y --no-install-recommends nginx openssl tini ca-certificates && \
	rm -rf /var/lib/apt/lists/*

RUN	mkdir -p /etc/ssl/certs

RUN	openssl genpkey -algorithm RSA -out /etc/ssl/certs/njeanbou.key -pkeyopt rsa_keygen_bits:2048 && \
   	openssl req -new -x509 -key /etc/ssl/certs/njeanbou.key -out /etc/ssl/certs/njeanbou.crt -days 365 -subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42/CN=${DOMAIN_NAME}/emailAddress=${DOMAIN_NAME}"

COPY	./conf/nginx.conf /etc/nginx/nginx.conf

RUN	update-ca-certificates

EXPOSE	443

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD	["nginx", "-g", "daemon off;"]

