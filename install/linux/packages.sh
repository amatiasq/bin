#!/bin/bash

echo "Install compilers"
apt -qq install -y build-essential pkg-config curl gcc g++;

echo "Install tools"
apt -qq install -y vim openssh-server htop meld unzip unrar
