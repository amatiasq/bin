#!/usr/bin/env bash

COMMAND="$1"
FILE="$2"

if [ "$COMMAND" != 'include' ] && [ "$COMMAND" != 'exclude' ]; then
  echo 'First parameter should be either "include" or "exclude"'
  exit 1
fi

while read path; do
  first=${path:0:1}
  path=${path/'~'/$HOME}

  if [ "$path" != "" ] && [ "$first" != '#' ]; then
    if [ "$first" = "!" ]; then

      if [ "$COMMAND" = 'exclude' ]; then
        echo "${path:1}";
      fi

    else
      if [ "$COMMAND" = 'include' ]; then
        echo "$path";
      fi

    fi
  fi
done < "$FILE"
