#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")


sed -e 1d games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  # WINNER
  # get winner_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name="$WINNER"")
  # if not found
  if [[ -z $WINNER_ID ]]
  then
    # set to null
    WINNER_ID=null
  fi
  # insert team  
  INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
  if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
  then
    echo "Inserted into teams, $WINNER"
  fi

  # OPPONENT
  # get opponent_id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name="$OPPONENT"")
  # if not found
  if [[ -z $OPPONENT_ID ]]
  then
    # set to null
    OPPONENT_ID=null
  fi
  # insert team  
  INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
  if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
  then
    echo "Inserted into teams, $OPPONENT"
  fi
done

sed -e 1d games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do  
  # GAME  
  # get winner_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")  
  # get opponent_id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  # get game_id  
  GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")
  # if not found
  if [[ -z $GAME_ID ]]
  then
    # set to null
    GAME_ID=null
  fi  
  # insert team  
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
  then
    # get game_id  
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")
    echo "Inserted into games, $GAME_ID"
  fi
done