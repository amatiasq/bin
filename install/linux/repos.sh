#!/bin/bash

echo "Conning bin..."
git clone git@github.com:amatiasq/bin ~/bin > /tmp/bin/install.log 2>&1

mkdir -p ~/repos
cd ~/repos

for repo in $(cat ~/bin/install/repos.txt)
do
  echo "Cloning $repo..."

  if [ ! -d $(basename "$repo") ]
  then
    git clone "git@github.com:$repo" > /tmp/bin/install.log 2>&1
  fi
done

echo "Done"
