#!/bin/sh


cd /app



create_config_file()
{	
	
	nc -vz mariadb 3306
	
	while [ $? -ne 0 ]
		do
			sleep 1
			nc -z mariadb 3306 > /dev/null
		done

	sleep 3

	if [ ! -f /app/wp-config.php ]; then
		wp config create --dbhost=mariadb:3306 --dbname=$DB_Name --dbuser=$User --dbpass=$Password --skip-check
	fi
	


	wp core install --url="$URL" --title="Your Block" --admin_name="$ADMINE_NAME" --admin_password="$ADMINE_PASS" --admin_email="$ADMINE_EMAIL"
	wp user create "$User" "$User_email" --role=author --user_pass="$Password"
}

create_config_file




exec php-fpm82 --nodaemonize
