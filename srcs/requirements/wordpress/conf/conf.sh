#!/bin/sh

# exporting env variabls

export $(cat .env | tr '\n' ' ')

cd /app

wp core config --dbhost=localhost:3306 --dbname=$DB_NAME --dbuser=$User --dbpass=$Password

wp core install --url=$DN --title="$WB_TITLE" --admin_name=$ADMINE_NAME --admin_password="${ADMINE_PASS}" --admin_email=$ADMINE_EMAIL

exec php-fpm82 --nodaemonize
