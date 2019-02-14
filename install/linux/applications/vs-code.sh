#!/bin/bash

echo "VS Code"
cd /tmp

echo "    Downloading"
wget -O vs-code.deb https://go.microsoft.com/fwlink/?LinkID=760868 > /dev/null

echo "    Installing"
sudo dpkg -i vs-code.deb > /dev/null

echo "    Done"
