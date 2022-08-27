#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

RESULT() {
  # The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
  DATA=$($PSQL "SELECT symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  echo "$DATA" | sed 's/ |//g' | while read SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE
  do
    echo -e "The element with atomic number $1 is "$NAME" ($SYMBOL). It's a "$TYPE", with a mass of "$ATOMIC_MASS" amu. "$NAME" has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
}

if [[ -z "$1" ]]
then
  echo "Please provide an element as an argument."
else  
  # if input is not a number
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    # check symbol and name
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    else
      RESULT $ATOMIC_NUMBER
    fi
  else
    # check atomic_number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    else
      RESULT $ATOMIC_NUMBER
    fi
  fi
fi