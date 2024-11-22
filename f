#!/bin/bash

function main() {
  if [[ $1 == https://www.youtube.com/watch* ]] || [[ $1 == https://youtu.be/* ]];
  then
    # default pattern extract_wisdom
    pattern="${2:-extract_wisdom}"
    fabric -g=es -y "$1" -p "$pattern"
  else
    echo "Usage: $0 <youtube-url> <pattern>"
    fabric -l \
    | rainbow \
    | xargs echo "Available patterns:"
  fi
}

function rainbow() {
  index=0
  while read line; do
    color=$((30+(index%9)))
    echo -e "\033[1;${color}m$line\033[0m"
    index=$((index+1))
  done
}

# Entry point
main "$@"
