#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# comment to PRO
# echo $($PSQL "TRUNCATE users, games, guesses")

echo "Enter your username:"
read USERNAME

# if username exists
USERNAME_EXISTS=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# if customer doesn't exist
if [[ -z $USERNAME_EXISTS ]]
then
  # print welcome message
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  # get games played
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USERNAME_EXISTS")

  # get best game
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USERNAME_EXISTS")
  echo $BEST_GAME

  # print welcome message
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# User identification
USER_IDENTIFICATION=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# GAME DEVELOPMENT

GUESS() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  
  read PLAYER_GUESS

  # if input is not a number
  if [[ ! $PLAYER_GUESS =~ ^[0-9]+$ ]]
  then
    GUESS "That is not an integer, guess again:"
  else    
    ((COUNT=COUNT+1))
    if [[ $PLAYER_GUESS == $SECRET_NUMBER ]]
    then      
      echo "You guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"      
      UPDATE_GUESSES_RESULT=$($PSQL "UPDATE games SET guesses = $COUNT WHERE game_id = $CURRENT_GAME")      
    else
      if [[ $PLAYER_GUESS < $SECRET_NUMBER ]]
      then
        GUESS "It's higher than that, guess again:"
      else
        GUESS "It's lower than that, guess again:"
      fi
    fi
  fi
}

GAME() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # create new game
  NEW_GAME_RESULT=$($PSQL "INSERT INTO games(user_id) VALUES($USER_IDENTIFICATION)")
  CURRENT_GAME=$($PSQL "SELECT MAX(game_id) FROM games")
  let COUNT

  # game start  
  GUESS
}

# generate a random number between 1 and 1000 for users to guess
SECRET_NUMBER=$((1 + $RANDOM % 1000))
# echo $SECRET_NUMBER
GAME "Guess the secret number between 1 and 1000:"
