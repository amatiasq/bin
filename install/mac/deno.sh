#!/usr/bin/env bash

#curl -fsSL https://deno.land/x/install/install.sh | sh

deno install --allow-read --allow-run --allow-write -f --unstable https://deno.land/x/denon/denon.ts
deno install --allow-read --allow-env --allow-run -n vr https://deno.land/x/velociraptor/cli.ts
