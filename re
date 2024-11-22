#!/bin/bash

SUCCESS=0
FAILURE=0

# make tmp file
TMPFILE=$(mktemp)

for i in {1..10}
do
  "$@" 2>&1 | tee $TMPFILE

  if cat $TMPFILE | grep ' ERROR:' > /dev/null;
  then
    FAILURE=$((FAILURE+1))
  else
    SUCCESS=$((SUCCESS+1))
  fi

  rm $TMPFILE
done

echo "Success: $SUCCESS"
echo "Failure: $FAILURE"
