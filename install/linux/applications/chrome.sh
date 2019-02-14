#!/bin/bash

echo "Google Chrome..."
cd /tmp

echo "    Dependencies"
apt-get -qq install -y libcurl3 libnspr4-0d libnss3-1d libxss1 libgconf2-4

echo "    Downloading"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "    Installing"
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "    Done"
