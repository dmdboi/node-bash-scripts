#!/bin/bash
# Setup Git SSH Access
ghuser=$1
ghtoken=$2

ssh-keygen -t rsa -b 4096 -C "Test" -N "" -f ~/.ssh/id_rsa -q
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

curl -u $ghuser:$ghtoken --data "{\"title\": \"TestKey\", \"key\": \"$(cat ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys

ssh -o "StrictHostKeyChecking=no" -T git@github.com