#!/bin/bash

mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html
wp core download --path=$WP_PATH --allow-root


#if ! [ -d /var/www/html ];
#then
   # echo "Inception : ✔ Download core wordpress files to /var/www/html/"
   # wp core download --path=/var/www/html --allow-root
#fi

cd /var/www/html;

if [ -f wp-config.php ] && wp config has DB_PASSWORD --allow-root;
then
    echo "wp-config.php is found"
else
    cp wp-config-sample.php wp-config.php

    wp config set --allow-root DB_HOST $DB_HOST --path="."
    wp config set --allow-root DB_NAME $MYSQL_DB --path="." 
    wp config set --allow-root DB_USER $MYSQL_USER --path="."
    wp config set --allow-root DB_PASSWORD "${MYSQL_PASSWORD}" --path="." --quiet
    wp config set --allow-root table_prefix $MYSQL_TABLE --path="."
    wp config set --allow-root WP_DEBUG false --path="." --raw
    wp config set --allow-root WP_DEBUG_LOG false --path="." --raw

    # Refreshes the salts defined in the wp-config.php file.
    wp config shuffle-salts --allow-root

    echo "wp-config.php file generated"

    echo "Installing Wordpress"
    wp core install --allow-root \
        --path="." \
        --url=$DOMAIN_NAME \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL
    wp plugin update --path="." --allow-root --all

    # Create user
    wp user create --path=/var/www/html --allow-root \
        $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD \
        --role=author --porcelain
fi

# Create PID file (/run/php/php7.4-fpm.pid)
php-fpm7.4 -F
