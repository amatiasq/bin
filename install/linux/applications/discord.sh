#!/bin/bash

echo "Discord..."
cd /tmp

echo "    Downloading"
wget -O discord.deb https://discordapp.com/api/download?platform=linux&format=deb > /tmp/bin/install.log 2>&1

echo "    Installing"
sudo dpkg -i discord.deb > /tmp/bin/install.log 2>&1

echo "    Done"
