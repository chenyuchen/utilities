#!/bin/bash

t=0.0

while true
do	
	t=$(/usr/bin/time  curl --silent www.google.com 2>&1 1>/dev/null|awk '{print $3}'|awk -F ':' '{print $2}'|sed 's/elapsed//g'|head -n 1)
	echo "t=$t"
	if (( $(echo "$t > 10.0" |bc -l) ));then
		echo "break"
		break
	fi
	sleep 2
done

