#!/usr/bin/env bash

echo "Node..."

echo "    Install stable"
nvm install stable

echo "    Install LTS"
nvm install lts/*

echo "    Activate stable"
nvm use stable

echo "    Install basic packages"
npm install -g eslint
npm install -g nodemon
npm install -g typescript

echo "    Done"
