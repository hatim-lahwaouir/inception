#!/bin/sh


cd /app


nc -vz mariadb 3306

while [ $? -ne 0 ]
	do
		sleep 1
		nc -z mariadb 3306 > /dev/null
	done

sleep 5


wp config create --dbhost=mariadb:3306 --dbname=$DB_Name --dbuser=$User --dbpass=$Password




wp core install --url="$URL" --title="Your Block" --admin_name="$ADMINE_NAME" --admin_password="$ADMINE_PASS" --admin_email="$ADMINE_EMAIL"
if ! wp user list --field=user_login | grep -q "$User"; then
	wp user create "$User" "$User_email" --role=author --user_pass="$Password"
fi





exec php-fpm81 --nodaemonize
