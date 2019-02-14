#!/bin/bash

# if [ "`whoami`" != "root" ]
# then
# 	echo "This script must be executed as root"
# 	exit
# fi

echo "Installing git"
sudo apt -qq install -y git

echo "Cloning amatiasq/bin"
cd /tmp

if [ ! -d bin ]
then
  git clone https://github.com/amatiasq/bin
fi

cd bin/install/linux

# Cloning with HTTPS permissions get lost
find . -name '*.sh' | xargs chmod +x

./drivers.sh
./repos.sh
./packages.sh

./applications/chrome.sh
./applications/spotify.sh
./applications/vlc.sh

./applications/nginx.sh
./applications/nvm.sh
./applications/node.sh
./applications/vs-code.sh

./applications/discord.sh
./applications/skype.sh
./applications/steam.sh
./applications/slack.sh

./applications/gimp.sh
./applications/free-cad.sh

./clean-up.sh
