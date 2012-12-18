#!/bin/bash

storageFile=~/.lastReview

if [ ! -f $storageFile ]
then touch $storageFile
fi

if [ $# -eq 0 ]
then from="$(cat $storageFile)"
else from="$1"
fi

if [ "$from" = "reset" ]
then
	rm $storageFile
	exit
fi

commits=$(git log --author="Quezada" | grep "commit " | awk '{print $2}' | tail -r )
found=false

if [ -z "$from" ]
then found=true
fi

for i in $commits
do
	if $found
	then git show -w $i
	elif [ "$i" = "$from" ]
	then found=true
	fi

	echo "$i" > $storageFile
done
