#!/bin/bash

echo "VS Code"
cd /tmp

echo "    Downloading"
wget -O vs-code.deb https://go.microsoft.com/fwlink/?LinkID=760868 > /tmp/bin/install.log 2>&1

echo "    Installing"
sudo dpkg -i vs-code.deb > /tmp/bin/install.log 2>&1

echo "    Done"
