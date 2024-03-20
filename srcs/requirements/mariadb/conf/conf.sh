#!/bin/bash




echo "mariadb start"
service mariadb start

while true;
	do
	service mariadb status | grep -q Uptime
	if [ $? -eq 0 ]; then
		break
	fi
	sleep 1
done

sleep 2


mariadb -uroot << EOF
CREATE USER IF NOT EXISTS "$User"@'%' IDENTIFIED BY "${Password}";
CREATE DATABASE IF NOT EXISTS $DB_Name;
GRANT ALL PRIVILEGES ON $DB_Name.* TO "${User}"@'%';
exit
EOF

service mariadb stop

mysqld_safe
