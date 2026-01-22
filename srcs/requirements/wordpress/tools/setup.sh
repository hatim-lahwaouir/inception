#!/bin/sh



apk update
apk add \
  php81 \
  php81-cli \
  php81-fpm \
  php81-openssl \
  php81-phar \
  php81-mysqli \
  php81-mysqlnd \
  php81-mbstring \
  php81-curl \
  php81-zip

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

""" > /etc/php81/php-fpm.d/www.conf


mkdir -p /app
cd /app
php -d memory_limit=256M /usr/local/bin/wp core download
