#!/bin/bash

GH_KEYS="https://github.com/settings/keys"

if [ ! -f ~/.ssh/id_rsa.pub ]
then
  echo "Generating SSH key"
  ssh-keygen
fi

echo "Add this public key to Github"
cat ~/.ssh/id_rsa.pub

if which xdg-open > /dev/null
then
  xdg-open "$GH_KEYS" > /tmp/bin/install.log 2>&1
elif which gnome-open > /dev/null
then
  gnome-open "$GH_KEYS" > /tmp/bin/install.log 2>&1
fi

read -p 'Press [Enter] key to continue...' -s
