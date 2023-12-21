#!/usr/bin/env bash

# Basic tools
brew install --cask 1password
brew install --cask brave-browser
brew install --cask iterm2
brew install --cask sublime-text

# Hardware
brew install --cask android-file-transfer
brew install --cask displaylink
brew install --cask jabra-direct
brew install --cask logi-options-plus
brew install --cask loopback
# brew install --cask paragon-ntfs

# Development
brew install --cask visual-studio-code
brew install --cask firefox
brew install --cask google-chrome

# Utilities
brew install --cask raycast
brew install --cask google-drive
brew install --cask synology-drive
brew install --cask calibre
brew install --cask docker
brew install --cask keka
brew install --cask xscope

# Entretainment
brew install --cask steam
brew install --cask spotify
brew install --cask vlc
brew install --cask discord
brew install --cask battle-net
brew install --cask minecraft
brew install --cask pokemon-tcg-live

# great tools
brew install handbrake
brew install --cask blender
brew install --cask openscad
brew install --cask unity-hub
brew install --cask obs
brew install --cask prusaslicer
brew install --cask autodesk-fusion360

# Veracrypt (requires osxfuse)
brew install --cask veracrypt
cd ~/Downloads
wget https://github.com/osxfuse/osxfuse/releases/download/macfuse-4.4.2/macfuse-4.4.2.dmg
open macfuse-4.4.2.dmg
