#!/usr/bin/env bash

# Basic tools
brew install --cask 1password
brew install --cask brave-browser
brew install --cask iterm2
brew install --cask sublime-text

# Hardware
brew install --cask android-file-transfer
brew install --cask displaylink
brew install --cask logi-options-plus
brew install --cask loopback
# brew install --cask paragon-ntfs

sudo softwareupdate --install-rosetta --agree-to-license
brew install --cask jabra-direct

# Development
brew install --cask visual-studio-code
brew install --cask firefox
brew install --cask google-chrome
brew install --cask arc

# Utilities
brew install --cask raycast
brew install --cask google-drive
brew install --cask synology-drive
brew install --cask calibre
brew install --cask docker
brew install --cask keka
brew install --cask xscope
# brew install --cask lm-studio # requires ARM

# Entretainment
brew install --cask steam
brew install --cask spotify
brew install --cask vlc
brew install --cask discord
brew install --cask djuced
brew install --cask battle-net
brew install --cask minecraft

# great tools
brew install handbrake
brew install --cask blender
brew install --cask openscad
brew install --cask unity-hub
brew install --cask obs
brew install --cask prusaslicer
brew install --cask autodesk-fusion360
brew install --cask macmediakeyforwarder
brew install --cask charles

# YEGO
brew install --cask slack
brew install --cask tunnelblick
brew install --cask android-studio
brew install --cask tableplus
brew install --cask another-redis-desktop-manager

# Veracrypt (requires osxfuse)
brew install --cask veracrypt
cd ~/Downloads
wget https://github.com/osxfuse/osxfuse/releases/download/macfuse-4.4.2/macfuse-4.4.2.dmg
open macfuse-4.4.2.dmg
