#!/usr/bin/env bash

function run() bash "$HOME/bin/install/mac/$1"

run dotfiles.sh
run packages.sh
run shell.sh
run applications.sh
run repos.sh
run node.sh
# run rust.sh
run config.sh

cat "$HOME/bin/install/mac/messages.md"
