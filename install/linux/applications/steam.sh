#!/bin/bash

echo "Steam"
cd /tmp

echo "    Downloading"
wget "https://steamcdn-a.akamaihd.net/client/installer/steam.deb"

echo "    Install"
dpkg -i steam.deb

echo "    Done"
