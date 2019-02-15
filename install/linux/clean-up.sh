#!/bin/bash

echo "Cleaning packages..."
sudo apt autoremove > /tmp/bin/install.log 2>&1
