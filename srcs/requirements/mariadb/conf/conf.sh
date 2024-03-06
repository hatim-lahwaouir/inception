#!/bin/bash





service mariadb start
serv=mariadb

mariadb_start()
{
	while true;
       	do
		service $serv status | grep -q Uptime
		if [ $? -eq 0 ]; then
			break
		fi
		sleep 1
	done
}


mariadb_start
sleep 1

mariadb -uroot << EOF
DROP USER IF EXISTS $User;
CREATE USER "$User"@'%' IDENTIFIED BY "${Password}";
DROP DATABASE IF EXISTS $DB_Name;
CREATE DATABASE $DB_Name;
GRANT ALL PRIVILEGES ON $DB_Name.* TO "${User}"@'%';
exit
EOF

service mariadb stop

exec mysqld_safe
