#!/bin/bash
filename=/home/$USER/daily0.zip

if test -f "$filename"
then
	rm -f "$filename" 
else
	echo "$filename not found"
fi

/usr/local/bin/rsnapshot -v $1
