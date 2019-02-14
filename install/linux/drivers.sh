#!/bin/bash

echo "Drivers..."

# TODO: lspci might not return "NVIDIA" if driver not installed
if lspci | grep "NVIDIA" > /dev/null
then
  echo "    NVIDIA"
  sudo add-apt-repository ppa:graphics-drivers/ppa
  sudo apt -qq update
  sudo apt -qq install -y nvidia-390
fi

echo "    Done"
