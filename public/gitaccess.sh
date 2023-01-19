#!/bin/bash
# Setup Git SSH Access
ghuser=$1
ghtoken=$2
ssh_key=$3

# Variable Guards
if [ -z "$1" ]
then
  echo "| ERROR: Github User not supplied"
  exit
fi

if [ -z "$2" ]
then
  echo "| ERROR: Github Token not supplied"
  exit
fi

if [ -z "$3" ]
then
  echo "| ERROR: SSH Key Name not supplied"
  exit
fi

# The Good Stuff
echo "| Setting up Git SSH Access |"
ssh-keygen -t rsa -b 4096 -C "Git SSH Access" -N "" -f ~/.ssh/id_rsa -q
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

curl -u "$ghuser":"$ghtoken" --data "{\"title\": \"$ssh_key\", \"key\": \"$(cat ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys

ssh -o "StrictHostKeyChecking=no" -T git@github.com
echo "| Git SSH Access completed |"