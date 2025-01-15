#!/bin/bash

echo "Give me a Github access token with access to private repos..."
echo "[press INTRO to skip]"
open https://github.com/settings/tokens
read token

export GITHUB_TOKEN="$token"

mkdir -p ~/repos
cd ~/repos

$HOME/bin/clone-all-repos amatiasq

mkdir -p ~/yego
cd ~/yego

$HOME/bin/clone-all-repos GETYUGO --org

echo "Done"
