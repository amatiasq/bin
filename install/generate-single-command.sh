#!/bin/bash

packages=$(
  # get package list
  cat ./windows/packages.ps1 |
  # remove comments
  grep -ve '^#' |
  # get package name
  awk '{print $3}' |
  # concatenate in a single line
  xargs echo
)

echo "choco install $packages -y" > ./windows/packages-single-command.ps1
