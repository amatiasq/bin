#!/usr/bin/env bash

# Instal Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Homebrew cask
brew tap homebrew/cask

# Update homebrew
brew update

# Install homebrew pacakges
brew install deno
brew install python3
brew install zsh
brew install wget
#brew install hub
brew install jq
brew install watch
#brew install docker
#brew install imagemagick
#brew install youtube-dl
#brew install exiftool
brew install asciinema
brew install obs
brew install firefox
brew install loopback
brew install paragon-ntfs
brew install zoom
brew install thefuck

# NVM is a special case
brew install nvm
mkdir ~/.nvm
