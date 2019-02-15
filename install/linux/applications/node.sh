#!/usr/bin/env bash

echo "Node..."

echo "    Install stable"
nvm install stable

echo "    Install LTS"
nvm install lts/* > /tmp/bin/install.log 2>&1

echo "    Activate stable"
nvm use stable > /tmp/bin/install.log 2>&1

echo "    Install basic packages"
npm install -g eslint > /tmp/bin/install.log 2>&1
npm install -g nodemon > /tmp/bin/install.log 2>&1
npm install -g typescript > /tmp/bin/install.log 2>&1

echo "    Done"
