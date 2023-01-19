#!/bin/bash

# Secures NGINX with LetsEncrypt SSL
domain=$1
email=$2

# Variable Guards
if [ -z "$1" ]
then
  echo "| ERROR: Domain not supplied"
  exit
fi

if [ -z "$2" ]
then
  echo "| ERROR: Email not supplied"
  exit
fi

# The Good Stuff
echo "| Securing $domain with LetsEncrypt|"
sudo apt install certbot python3-certbot-nginx
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo certbot --nginx -d "$domain" -m "$email" -n --agree-tos --redirect

