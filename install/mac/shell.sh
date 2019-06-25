#!/usr/bin/env bash

# Set ZSH
chsh -s /bin/zsh

# Download prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 && \
  cd fonts && \
  ./install.sh && \
  cd .. && \
  rm -rf fonts

