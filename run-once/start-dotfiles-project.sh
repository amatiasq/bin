#!/bin/bash

# Requires `git`

# We create a bare repository so we don't have `.git` in our home
git init --bare "$HOME/.dot"

# We set the alias for managing the bare repo
echo 'alias dot="git --git-dir=$HOME/.dot/ --work-tree=$HOME"' >> $HOME/.bashrc
echo 'alias dot="git --git-dir=$HOME/.dot/ --work-tree=$HOME"' >> $HOME/.zshrc
