#!/usr/bin/env bash

source $(brew --prefix nvm)/nvm.sh

nvm install stable
nvm install 18
nvm install 16
nvm install 14
nvm install 12

nvm use stable

npm install -g eslint
npm install -g nodemon
npm install -g typescript
