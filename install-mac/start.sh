#!/usr/bin/env bash

function run() {
  cat "$HOME/bin/install-mac/$1" | bash
}

run dotfiles.sh
run packages.sh
run node.sh
run repos.sh
run applications.sh
