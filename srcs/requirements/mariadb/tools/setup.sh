#!/bin/sh


# exporting env variabls

apt update -y
apt -y install mariadb-server
#sed -i "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf
echo """
[mysqld]

pid-file                = /run/mysqld/mysqld.pid
basedir                 = /usr
datadir                 = /var/lib/mysql

bind-address            = 0.0.0.0
""" > /etc/mysql/mariadb.conf.d/50-server.cnf
