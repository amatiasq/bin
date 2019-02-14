#!/bin/bash

echo "Drivers..."

# TODO: lspci might not return "NVIDIA" if driver not installed
if lspci | grep "NVIDIA" > /dev/null
then
  echo "    NVIDIA"
  add-apt-repository ppa:graphics-drivers/ppa
  apt -qq update
  apt -qq install -y nvidia-390
fi

echo "    Done"
