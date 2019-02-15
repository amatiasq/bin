#!/bin/bash

echo "Drivers..."

# TODO: lspci might not return "NVIDIA" if driver not installed
if lspci | grep "NVIDIA" > /dev/null
then
  echo "    NVIDIA"
  sudo add-apt-repository ppa:graphics-drivers/ppa > /tmp/bin/install.log 2>&1
  sudo apt -qq update > /tmp/bin/install.log 2>&1
  sudo apt -qq install -y nvidia-390 > /tmp/bin/install.log 2>&1
fi

echo "    Done"
