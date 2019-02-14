#!/bin/bash

echo "FreeCAD"

echo "    Add repository"
sudo add-apt-repository ppa:freecad-maintainers/freecad-stable

echo "    Update"
sudo apt Update

echo "    Installing"
sudo apt install freecad freecad-doc

echo "    Done"
