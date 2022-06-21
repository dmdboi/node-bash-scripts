#!/bin/bash
# Deploy NodeJS project with PM2
user=$1
ghuser=$2
project=$3

su $user
git clone git@github.com:$ghuser/$project.git
cd $project

// Run install script
npm install 
pm2 start app.js