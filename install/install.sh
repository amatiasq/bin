#!/bin/bash

if uname | grep -e '^MS.*NT'
then

  echo "Detected Windows. Running scripts..."
  curl https://raw.githubusercontent.com/amatiasq/bin/master/install/windows/init.ps1 | powershell

elif uname | grep 'Linux'
then

  echo "Detected GNU/Linux. Running scripts..."
  curl https://raw.githubusercontent.com/amatiasq/bin/master/install/linux/init.sh | bash

elif uname | grep 'Darwin'
then

  echo "Detected MacOS. Running scripts..."
  curl https://raw.githubusercontent.com/amatiasq/bin/master/install/mac/init.sh | bash

else
  echo "Unknown system. Aborting"
  exit 1
fi

echo "OPERATION COMPLETED."
