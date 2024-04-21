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
brew install ffmpeg
brew install fzf
brew install gh
brew install git-lfs
brew install imagemagick
brew install jq
brew install thefuck
brew install watch
brew install wget
brew install youtube-dl
brew install zsh

# https://github.com/Y2Z/monolith
brew install monolith

# NVM is a special case
brew install nvm
mkdir ~/.nvm

brew tap samwho/spacer \
  && brew install spacer

brew tap joerdav/xc \
  && brew install xc

brew tap jakehilborn/jakehilborn \
  && brew install displayplacer

brew tap microsoft/git \
  && brew install --cask git-credential-manager-core

brew install supabase/tap/supabase
brew install gptscript-ai/tap/gptscript
brew install ynqa/tap/jnv
brew install charmbracelet/tap/freeze

# Bun
curl -fsSL https://bun.sh/install | bash

# # SurrealDB
# curl --proto '=https' --tlsv1.2 -sSf https://install.surrealdb.com | sh
