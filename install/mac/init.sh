#!/usr/bin/env bash

# This will request XCode command line tools installation

git --version > /dev/null

curl https://raw.githubusercontent.com/amatiasq/bin/master/run-once/generate-rsa.sh | bash

echo 'Add key to Github, press [Enter] when done.'
open 'https://github.com/settings/ssh'
read < /dev/tty

git clone git@github.com:amatiasq/bin $HOME/bin

$HOME/bin/install/mac/start.sh
