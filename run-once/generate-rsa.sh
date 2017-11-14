RSA=~/.ssh/id_rsa.pub

if [ ! -f $RSA ]
then
  echo 'Generating RSA...'
  ssh-keygen -t rsa -C "amatiasq@gmail.com" > /dev/null
fi

cat $RSA > pbcopy
cat $RSA
echo -e '\nCopied to clipboard.'
