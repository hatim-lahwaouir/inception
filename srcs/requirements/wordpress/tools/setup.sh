#!/bin/sh



apk update
apk add php php-fpm php-openssl php-phar 

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

echo """
[global]
include=/etc/php82/php-fpm.d/*.conf
""" > /etc/php82/php-fpm.conf


echo """
[www]
user = nobody
group = nobody
listen = 127.0.0.1:9000
pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3 
;listen.allowed_clients = nginx
""" > /etc/php82/php-fpm.d/www.conf

mkdir /app
cd /app
wp core download
