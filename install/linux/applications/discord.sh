#!/bin/bash

echo "Discord..."
cd /tmp

echo "    Downloading"
wget -O discord.deb https://discordapp.com/api/download?platform=linux&format=deb

echo "    Installing"
sudo dpkg -i discord.deb

echo "    Done"
