#!/usr/bin/env bash

# Instal Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrew cask
brew tap homebrew/cask

# Update homebrew
brew update

# Install homebrew pacakges
brew install asciinema
brew install deno
brew install imagemagick
brew install jq
brew install thefuck
brew install watch
brew install wget
brew install youtube-dl
brew install zsh

# NVM is a special case
brew install nvm
mkdir ~/.nvm
