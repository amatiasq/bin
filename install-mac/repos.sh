#!/usr/bin/env bash

REPOS="$HOME/repos"

mkdir $REPOS && cd $REPOS

function clone() {
  git clone git@github.com:amatiasq/$1
}

clone amatiasq.github.io
clone notes

clone amq-tools
clone jsbase
clone glib
clone lulas
clone pathfinding

clone import-sort
clone vsc-sort-imports
clone import-sort-style-module-compact

clone wMUD
clone term
clone streams
clone signature.js
