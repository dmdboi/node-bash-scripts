#!/bin/bash
# Configures a new NGINX server block.

domain=$1
port=$2
block="/etc/nginx/sites-available/$domain"

echo "| Creating new Server Block - $domain $port |"
# Create the Nginx server block file:
sudo tee $block > /dev/null <<EOF 
server {
        listen 80;
        listen [::]:80;

        server_name $domain www.$domain;

        location / {
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header Host \$host;
            proxy_pass http://localhost:$port;
            proxy_http_version 1.1;
            proxy_set_header Upgrade \$http_upgrade;
            proxy_set_header Connection "upgrade";
        }
}
EOF

echo "| Linking Server Block |"
# Link to make it available
ln -s $block /etc/nginx/sites-enabled

echo "| Checking & reloading NGINX |"
# Test configuration and reload if successful
sudo nginx -t && sudo service nginx reload