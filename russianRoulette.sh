#!/usr/local/bin/bash

echo -e "Russian Roulette!"
sleep 0.2

bulletPos="$(( $RANDOM % 6 ))"
alive=true
rounds=0

main () {
	echo "Round $rounds"
	echo "You Load A Bullet."
	echo -n "You Spin The Cylinder    "
	loading &
	pid="$!"

	sleep 2

	kill $pid

	echo -en "\a\nYou Shot And"
	sleep 0.3
	
	if [ "$bulletPos" == "$(( $RANDOM % 6 ))" ]; then
		alive=false
	fi
	
	if $alive; then
		echo -e " Survived!!"
		rounds=$(( $rounds + 1 ))
		sleep 1
		main
	else
		echo -e " Died!"
		echo "You survived $rounds Rounds!"
	fi
}

loading () {
	bar=( '.  ' '.. ' '...' )

	while true; do
		for i in "${bar[@]}"; do
			echo -en "\e[3D$i"
			sleep 0.2
		done
	done
}

main
