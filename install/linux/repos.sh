#!/bin/bash

echo "Conning bin..."
git clone git@github.com:amatiasq/bin ~/bin

mkdir -p ~/repos
cd ~/repos

for repo in $(cat ~/bin/install/repos.txt)
do
  echo "Cloning $repo..."

  if [ ! -d $(basename "$repo") ]
  then
    git clone "git@github.com:$repo"
  fi
done

echo "Done"
