#!/bin/sh


# exporting env variabls

export $(cat .env | tr '\n' ' ')

apt update -y

apt -y install mariadb-server

echo """
[client-server]
port = 3306

# Import all .cnf files from configuration directory
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

""" > /etc/mysql/mariadb.cnf

service mariadb start

sleep 2
mariadb 
<< EOF
CREATE USER "${User}"@'%' IDENTIFIED BY "${Password}";
CREATE DATABASE $DB_Name;
GRANT ALL PRIVILEGES ON ${DB_Name}.* TO "${User}"@'%';
exit
EOF


service mariadb stop


