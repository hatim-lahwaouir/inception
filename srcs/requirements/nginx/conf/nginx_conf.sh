#!/bin/sh

mkdir /acab

echo "<h1> hello </h1>" > /acab/index.html


echo """
http{
	server
	{
		listen 443 ssl;
		ssl_certificate /TLS/CRT/crt.crt;
    		ssl_certificate_key /TLS/PRIV_KEY/private.key;
		root /app;
	}

}

events{}

""" > /etc/nginx/nginx.conf


exec nginx -g "daemon off;"
