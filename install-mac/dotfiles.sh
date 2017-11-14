#!/usr/bin/env bash

DOT="git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME"

echo ".dotfiles-git" >> "$HOME/.gitignore"

git clone --bare git@github.com:amatiasq/dotfiles $HOME/.dotfiles-git

$DOT checkout

if [ $? -ne 0 ]; then
  mkdir -p .config-backup
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
  config checkout
fi

$DOT config --local status.showUntrackedFiles no

# Set post commit hook to push on commit
HOOK="$HOME/.dotfiles-git/hooks/post-commit"
echo `#!/bin/sh\ngit push origin master' > $HOOK
chmod +x $HOOK
