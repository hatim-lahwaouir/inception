#!/bin/sh

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

mariadb  << EOF
CREATE USER 'miloki'@'%' IDENTIFIED BY 'USER';
CREATE DATABASE wordpress_db;
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'miloki'@'%';
exit
EOF


service mariadb stop


