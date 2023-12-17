#!/usr/bin/env bash

# Installed via homebrew at ./packages.sh
# curl -fsSL https://deno.land/install.sh | sh

deno install \
  --allow-read \
  --allow-run \
  --allow-write \
  -f \
  --unstable \
  https://deno.land/x/denon/denon.ts

# install bun too
curl -fsSL https://bun.sh/install | bash