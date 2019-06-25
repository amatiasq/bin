#!/bin/bash

# echo "Conning bin..."
# git clone git@github.com:amatiasq/bin ~/bin

mkdir -p ~/repos
cd ~/repos

for repo in $(cat ~/bin/install/repos.txt)
do
  echo "Cloning $repo..."
  git clone "git@github.com:$repo"
done

echo "Done"
