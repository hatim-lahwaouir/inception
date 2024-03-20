#!/bin/bash




apt update -y
apt upgrade -y
apt -y install mariadb-server

echo """
[mysqld]
user = root
port = 3306
datadir = /var/lib/mysql
bind-address = mariadb
""" > /etc/mysql/mariadb.conf.d/50-server.cnf