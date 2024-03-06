#!/bin/sh


sleep 5
cd /app


wp config create --dbhost=mariadb:3306 --dbname=$DB_Name --dbuser=$User --dbpass=$Password


wp core install --url="$URL" --title="Your Blog Title" --admin_name="$ADMINE_NAME" --admin_password="$ADMINE_PASS" --admin_email="$ADMINE_EMAIL"


exec php-fpm82 --nodaemonize
