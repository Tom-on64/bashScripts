#!/usr/local/bin/bash

spinner=( ".  " ".. " "..."  )

count () {
	spin &
	pid="$!"

	for i in `seq 1 10`; do
		mkdir $i
		sleep 1
	done

	kill $pid
	echo ""
}

spin () {
	while [ 1 ]; do
		for i in "${spinner[@]}"; do
			echo -en "\e[?25l"
			echo -en "\r$i"
			sleep 0.2
			echo -en "\e[?25h"
		done
	done
}

count
