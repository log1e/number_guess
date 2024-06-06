#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET=$(( RANDOM % 1000 + 1))
echo $SECRET
# prmopt to enter username
echo "Enter your username:"
read USERNAME_INPUT

# select user_id from database
USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username = '$USERNAME_INPUT'")

# if username not in database
if [[ -z $USER_ID ]]
then
  # insert username into database
INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO usernames(username) VALUES('$USERNAME_INPUT')")
# get new user id
USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username = '$USERNAME_INPUT'")
echo "Welcome, $USERNAME_INPUT! It looks like this is your first time here."

else
  # if username is in database
  # query user info from database

  # USERNAME
  USERNAME=$($PSQL "SELECT username FROM usernames WHERE user_id = $USER_ID")

  # total games played
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM usernames WHERE user_id = $USER_ID")

  # best games
  BEST_GAME=$($PSQL "SELECT best_game FROM usernames WHERE user_id = $USER_ID")

  # print message
  #     Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
GUESSES=1
# compare user guess function

# is it a number?
while [[ $USER_GUESS != $SECRET ]]
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read USER_GUESS
    GUESSES=$(( GUESSES + 1))
  elif [[ $USER_GUESS > $SECRET ]]
  then
    echo "It's lower than that, guess again:"
    read USER_GUESS
    GUESSES=$(( GUESSES + 1))
  else
    echo "It's higher than that, guess again:"
    read USER_GUESS
    GUESSES=$(( GUESSES + 1))
  fi
done

# increment games played
NEW_GAMES_PLAYED=$(( GAMES_PLAYED + 1 ))

INSERT_GAMES_PLAYED_RESULT=$($PSQL "UPDATE usernames SET games_played = $NEW_GAMES_PLAYED WHERE user_id = $USER_ID")

# update best_game if applicable

# if first time playing and no best game record
if [[ -z $BEST_GAME ]]
then
  # insert guesses as best game
  INSERT_FIRST_BEST_GAME=$($PSQL "UPDATE usernames SET best_game = $GUESSES WHERE user_id = $USER_ID")
elif [[ $GUESSES < $BEST_GAME ]]
then
  # insert new guesses into database
  INSERT_BEST_GAME_RESULT=$($PSQL "UPDATE usernames SET best_game = $GUESSES WHERE user_id = $USER_ID")
fi

# my final message
echo "You guessed it in $GUESSES tries. The secret number was $SECRET. Nice job!"
