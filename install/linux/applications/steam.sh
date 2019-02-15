#!/bin/bash

echo "Steam"
cd /tmp

echo "    Downloading"
wget "https://steamcdn-a.akamaihd.net/client/installer/steam.deb" > /tmp/bin/install.log 2>&1

echo "    Install"
sudo dpkg -i steam.deb > /tmp/bin/install.log 2>&1

echo "    Done"
