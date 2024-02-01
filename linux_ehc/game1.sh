#!/bin/bash

choices=("Rock" "Paper" "Scissors")

while true; do
    read -p "Enter your guess (1-Rock, 2-Paper, 3-Scissors): " you

    # Input validation
    if ! [[ $you =~ ^[1-3]$ ]]; then
        echo "Invalid choice. Please enter a number between 1 and 3."
        continue
    fi

    bot=$(( (RANDOM % 3) + 1 ))

    echo "You chose ${choices[you -1]}"
    echo "Bot chose ${choices[bot -1]}"

    if [ $you -eq $bot ]; then
        echo "TIE"
    elif [[ ($you -eq 1 && $bot -eq 3) || ($you -eq 3 && $bot -eq 2) || ($you -eq 2 && $bot -eq 1) ]]; then
        echo "YOU WIN"
    else
        echo "BOT WIN"
    fi

    while true; do
        read -p "Do you want to continue? (y/n): " replay
        case $replay in
            [Yy]) break ;;
            [Nn]) exit ;;
            *) echo "Invalid input. Please enter 'y' or 'n'." ;;
        esac
    done
done
