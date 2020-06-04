#!/usr/bin/env bash

DOT=$($HOME/bin/helpers/dot.sh)

echo ".dot" >> "$HOME/.gitignore"

git clone --bare --depth=1 git@github.com:amatiasq/dotfiles $HOME/.dot

$DOT checkout

if [ $? -ne 0 ]; then
  mkdir -p .config-backup
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{}
  config checkout
fi

$DOT config --local status.showUntrackedFiles no
$DOT fetch --unshallow > .dotfetch.log &

# Set post commit hook to push on commit
HOOK="$HOME/.dot/hooks/post-commit"
echo '#!/bin/sh' > $HOOK
echo 'git push origin master' >> $HOOK
chmod +x $HOOK
