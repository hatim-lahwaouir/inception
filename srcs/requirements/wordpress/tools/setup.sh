#!/bin/sh



apk update
apk add php php-fpm php-openssl php-phar php-mysqli php-mysqlnd php-mbstring
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp



echo """
[www]
user = nobody
group = nobody
listen = wordpress:9000
pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3
;listen.allowed_clients = nginx
""" > /etc/php82/php-fpm.d/www.conf


mkdir -p /app
cd /app
wp core download
