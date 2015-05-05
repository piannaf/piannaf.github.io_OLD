#!/bin/bash

if [ -z "$1" ]; then 
  echo "usage: $0 <commit message>"
  exit
fi

# get commit message
msg=$1

# commit source
git add -A; git commit -m "$msg"

# commit build and push to github
curr_dir=`pwd`
cd ../build
  bundle exec middleman build; git add -A; git commit -m "$msg"; git push
cd $curr_dir
