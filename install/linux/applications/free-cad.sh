#!/bin/bash

echo "FreeCAD"

echo "    Add repository"
sudo add-apt-repository ppa:freecad-maintainers/freecad-stable > /tmp/bin/install.log 2>&1

echo "    Update"
sudo apt Update > /tmp/bin/install.log 2>&1

echo "    Installing"
sudo apt install freecad freecad-doc > /tmp/bin/install.log 2>&1

echo "    Done"
