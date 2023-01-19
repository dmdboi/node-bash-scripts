#!/bin/bash

# Creates new User, configures firewall, installs Node, PM2 & Nginx
user=$1

# Variable Guards
if [ -z "$1" ]
then
  echo "| ERROR: User not supplied"
  exit
fi

# The Good Stuff
sudo apt --assume-yes update 
sudo apt --assume-yes upgrade 

# Create new user
echo "| Creating new User - $user |"
adduser --disabled-password --gecos "" $user  
usermod -aG sudo $user
rsync --archive --chown=$user:$user ~/.ssh /home/$user

echo "| Setting up Firewall |"
## Setup SSH
ufw allow OpenSSH
ufw enable --force enable

echo "| Installing Node |"
# Install Node & PM2
cd ~
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt install --assume-yes nodejs
apt install --assume-yes build-essential

echo "| Installing PM2 |"
# Install PM2
npm install pm2@latest -g

echo "| Installing NGINX |"
# Install NGINX
apt install --assume-yes nginx
ufw allow 'Nginx HTTP'