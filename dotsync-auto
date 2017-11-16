#!/usr/bin/env bash

TMP_FILE=$(mktemp /tmp/abc-script.XXXXXX)
LOG="$HOME/dotsync-log.txt"
ERROR="$HOME/Desktop/dotsync-errors.txt"

date >> "$LOG"
$HOME/bin/dotsync >> "$LOG" 2>> "$TMP_FILE"

if [ $? -ne 0 ]; then
    date >> "$ERROR"
    cat "$TMP_FILE" >> "$ERROR"
    echo '===' >> "$ERROR"
fi

echo '===' >> "$LOG"
rm "$TMP_FILE"
