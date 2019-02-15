#!/bin/bash

echo "NVM..."
echo "    Installing"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash > /tmp/bin/install.log 2>&1

echo "    Done"