#!/bin/bash

DIR="$1"
MAX_SIZE="${2:-1920x1080}"

find "$DIR" -type f \( -iname "*.png" \) | while read -r img
do
    echo "$img"
    mogrify -resize $MAX_SIZE\> -quality 85 -define png:extent=1MB $img
done

find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) | while read -r img
do
    echo "$img"
    mogrify -resize $MAX_SIZE\> -quality 85 -define jpeg:extent=1MB $img
done

echo "Done!"
