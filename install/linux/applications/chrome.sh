#!/bin/bash

echo "Google Chrome..."
cd /tmp

echo "    Dependencies"
sudo apt -qq install -y libxss1 libgconf2-4 > /tmp/bin/install.log 2>&1

echo "    Downloading"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > /tmp/bin/install.log 2>&1

echo "    Installing"
sudo dpkg -i google-chrome-stable_current_amd64.deb > /tmp/bin/install.log 2>&1

echo "    Done"
