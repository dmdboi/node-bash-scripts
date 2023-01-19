#!/bin/bash
# Clone NodeJS project and install node_modules
ghuser=$1
repository=$2

# Variable Guards
if [ -z "$1" ]
then
  echo "| ERROR: Github User not supplied"
  exit
fi

if [ -z "$2" ]
then
  echo "| ERROR: Github Repo not supplied"
  exit
fi

# The Good Stuff
echo "| Cloning as current user into $repository |"
git clone git@github.com:"$ghuser"/"$repository".git
cd "$repository" || exit
npm install