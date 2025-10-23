#!/bin/bash

brew tap nicoverbruggen/homebrew-cask
brew install --cask phpmon

# to get PHP versions
brew tap shivammathur/php

composer global require laravel/valet

cd $YEGO_DIR
composer install
