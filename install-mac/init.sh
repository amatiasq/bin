#!/usr/bin/env bash

# This will request XCode command line tools installation
git --version > /dev/null

curl https://raw.githubusercontent.com/amatiasq/bin/master/run-once/generate-rsa.sh | bash -e

echo 'Add key to Github, press [Enter] when done.'
read

git clone git@github.com:amatiasq/bin $HOME/bin

$HOME/bin/install-mac/start.sh
