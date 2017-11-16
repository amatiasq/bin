#!/usr/bin/env bash

if ping -c 2 google.com; then
    $HOME/bin/helpers/dotsync-sleep.sh
fi