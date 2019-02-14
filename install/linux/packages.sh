#!/bin/bash

echo "Install compilers"
sudo apt -qq install -y build-essential pkg-config curl gcc g++;

echo "Install tools"
sudo apt -qq install -y vim openssh-server htop meld unzip unrar
