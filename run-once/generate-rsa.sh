#!/bin/bash -e

RSA="$HOME/.ssh/id_rsa.pub"

if [ ! -f $RSA ]
then
  echo 'Generating RSA...'
  ssh-keygen -t rsa -C "amatiasq@gmail.com" > /dev/null
fi

cat $RSA | pbcopy
cat $RSA

echo '\nCopied to clipboard.'
