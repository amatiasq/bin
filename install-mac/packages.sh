#!/usr/bin/env bash

# Copy dotfiles

# Instal Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Homebrew cask
brew tap caskroom/cask

# Update homebrew
brew update

# Install homebrew pacakges
brew install caskroom/cask/brew-cask 2> /dev/null
brew install the_silver_searcher
brew insatll python3
brew install zsh
brew install wget
brew install hub

# NVM is a special case
brew install nvm
mkdir ~/.nvm
