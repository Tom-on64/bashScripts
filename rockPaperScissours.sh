#!/usr/local/bin/bash

init () {
	clear
	echo -en "Weclome To Rock Paper Scissours! \n\n1) Singleplayer\n2) Multiplayer\n0) Quit\n\n> "
	read input
	if [ "$input" == "1" ]; then
		singleplayer
	elif [ "$input" == "2" ]; then
		multiplayer
	elif [ "$input" == "0" ]; then
		echo "Goodbye!"
	else
		echo "Please Choose A Valid Option!"
		sleep 3
		init
	fi
}

singleplayer () {
	pid="$!"
	clear
	echo -en "What Do You Want To Play? \n\n1) Rock\n2) Paper\n3) Scissours\n0) Back\n\n> "
	read input
	if [ "$input" == "1" ]; then
		echo "You Choose Rock!"
	elif [ "$input" == "2" ]; then
		echo "You Choose Paper!"
	elif [ "$input" == "3" ]; then
		echo "You Choose Scissours!"
	elif [ "$input" == "0" ]; then
		kill $pid
		init
	else
		echo "Please Choose A Valid Option!"
		sleep 3
		kill $pid
		singleplayer
	fi

	aiChoice="$(( $RANDOM % 3 + 1 ))"

	if [ "${aiChoice}" == "1" ]; then
		echo "AI Choose Rock"
	elif [ "${aiChoice}" == "2" ]; then
		echo "AI Choose Paper"
	elif [ "${aiChoice}" == "3" ]; then
		echo "AI Choose Scissours"
	else
		echo "ERROR"
	fi
	
	if [ "$(( $input - $aiChoice ))" == 0 ]; then
		echo "Tie!"
		sleep 5
		init
	elif [ "$(( $input - $aiChoice ))" == "1" ] || [ "$(( $input - $aiChoice ))" == "-2" ]; then
		echo "You Win!!"
		sleep 5
		init
	elif [ "$(( $input - $aiChoice ))" == "-1" ] || [ "$(( $input - $aiChoice ))" == "2"]; then
		echo "You Lost!!"
		sleep 5
		init
	else 
		echo "ERROR"
	fi
}

multiplayer () {
	pid="$!"
	clear
	echo -en "What Do You Want To Play P1? \n\n1) Rock\n2) Paper\n3) Scissours\n0) Back\n\n> "
	read -s input1
	if [ "$input1" == "1" ]; then
		echo -e "\n"
	elif [ "$input1" == "2" ]; then
		echo -e "\n"
	elif [ "$input1" == "3" ]; then
		echo -e "\n"
	elif [ "$input1" == "0" ]; then
		kill $pid
		init
	else
		echo "Please Choose A Valid Option!"
		sleep 3
		kill $pid
		multiplayer
	fi

	echo -en "What Do You Want To Play P2? \n\n1) Rock\n2) Paper\n3) Scissours\n0) Back\n\n> "
	read -s input2
	if [ "$input2" == "1" ]; then
		echo -e "\n"
	elif [ "$input2" == "2" ]; then
		echo ""
	elif [ "$input2" == "3" ]; then
		echo -e "\n"
	elif [ "$input2" == "0" ]; then
		kill $pid
		init
	else
		echo "Please Choose A Valid Option!"
		sleep 3
		kill $pid
		multiplayer
	fi

	if [ "${input1}" == "1" ]; then
		echo "P1 Choose Rock"
	elif [ "${input1}" == "2" ]; then
		echo "P1 Choose Paper"
	elif [ "${input1}" == "3" ]; then
		echo "P1 Choose Scissours"
	else
		echo "ERROR"
	fi

	if [ "${input2}" == "1" ]; then
		echo "P2 Choose Rock"
	elif [ "${input2}" == "2" ]; then
		echo "P2 Choose Paper"
	elif [ "${input2}" == "3" ]; then
		echo "P2 Choose Scissours"
	else
		echo "ERROR"
	fi

	if [ "$(( $input1 - $input2 ))" == 0 ]; then
		echo "Tie!"
		sleep 5
		init
	elif [ "$(( $input1 - $input2 ))" == "1" ] || [ "$(( $input1 - $input2 ))" == "-2" ]; then
		echo "P1 Won!!"
		sleep 5
		init
	elif [ "$(( $input1 - $input2 ))" == "-1" ] || [ "$(( $input1 - $input2 ))" == "2"]; then
		echo "P2 Won!!"
		sleep 5
		init
	else 
		echo "ERROR"
	fi
}

init
