#!/usr/bin/env bash

# Instal Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrew cask
brew tap homebrew/cask

# Update homebrew
brew update

# Install homebrew pacakges
brew install deno
brew install ffmpeg
brew install fzf
brew install f2 # batch file renaming
brew install gh
brew install git-lfs
brew install git-who
brew install imagemagick
brew install jq
brew install jd
brew install neilotoole/sq/sq
brew install pyenv
brew install thefuck
brew install tree
brew install watch
brew install wget
brew install xo/xo/usql
brew install zsh
brew install helix
brew install yt-dlp

brew install ollama
brew services start ollama

# NVM is a special case
brew install nvm
mkdir ~/.nvm

brew tap jakehilborn/jakehilborn \
  && brew install displayplacer

brew tap hashicorp/tap
  && brew install hashicorp/tap/terraform

# Bun
curl -fsSL https://bun.sh/install | bash

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
