#!/bin/sh


sleep 5
cd /app




create_config_file()
{	
	if [ -f /app/wp-config.php ]; then
		rm -rf wp-config.php
	fi
	wp config create --dbhost=mariadb:3306 --dbname=$DB_Name --dbuser=$User --dbpass=$Password
}

create_config_file

wp core install --url="$URL" --title="Your Block" --admin_name="$ADMINE_NAME" --admin_password="$ADMINE_PASS" --admin_email="$ADMINE_EMAIL"




exec php-fpm82 --nodaemonize
