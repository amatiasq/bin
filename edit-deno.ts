#!/bin/bash

TMP_FILE=$(mktemp)

scp amatiasq.com:./vps/docker/com_amatiasq/www/deno.ts $TMP_FILE-deno.ts

code --wait $TMP_FILE-deno.ts

scp $TMP_FILE-deno.ts amatiasq.com:./vps/docker/com_amatiasq/www/deno.ts

rm $TMP_FILE-deno.ts
