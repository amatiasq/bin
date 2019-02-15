#!/bin/bash

echo "Install compilers"
sudo apt -qq install -y build-essential pkg-config curl gcc g++ > /tmp/bin/install.log 2>&1

echo "Install tools"
sudo apt -qq install -y vim openssh-server htop meld unzip unrar > /tmp/bin/install.log 2>&1
