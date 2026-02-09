#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$(( RANDOM % 1000 + 1 ))
MAX_USERNAME_LENGTH=22

echo "Enter your username:"
read USER

#
# Trim user name to 22 chars if over.
#
if [[ ${#USER} -gt $MAX_USERNAME_LENGTH ]]; then
  USERNAME=${USER:0:MAX_USERNAME_LENGTH}
else
  USERNAME=$USER
fi

USER_ID="$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME';")"
if [[ -z $USER_ID ]]; then
  RESULT="$($PSQL "INSERT INTO users (name) VALUES ('$USERNAME');")"
  echo RESULT $RESULT
  USER_ID="$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME';")"
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  NUM_GAMES="$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id = $USER_ID;")"
  LEAST_GUESSES="$($PSQL "SELECT MIN(nGuesses) FROM games WHERE user_id = $USER_ID;")"
  if [[ -z $LEAST_GUESSES ]]; then
    LEAST_GUESSES=0
  fi
  echo "Welcome back, $USERNAME! You have played $NUM_GAMES games, and your best game took $LEAST_GUESSES guesses."
fi

#
# Enter the game.
#
NUM_GUESSES=0
GUESS=1001
echo "Guess the secret number between 1 and 1000:"
until [ $GUESS -eq $NUMBER ]
do
  read INPUT

  if [[ -z "$INPUT" ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi
  if [[ ! "$INPUT" =~ ^-?[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  GUESS=$INPUT

  ((NUM_GUESSES++))
  if [[ $GUESS -gt $NUMBER ]]; then
    echo "It's lower than that, guess again:"
  fi
  if [[ $GUESS -lt $NUMBER ]]; then
    echo "It's higher than that, guess again:"
  fi
done

#
# Save off the info from this game.
#
echo "You guessed it in $NUM_GUESSES tries. The secret number was $NUMBER. Nice job!"
RESULT="$($PSQL "INSERT INTO games (user_id, nGuesses) VALUES ($USER_ID, $NUM_GUESSES);")"
