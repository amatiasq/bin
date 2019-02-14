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
git clone https://github.com/amatiasq/bin
cd bin/install/linux

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
