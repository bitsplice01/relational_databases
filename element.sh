#!/bin/bash

#
# Chnage the field separator and the output alignment
# This change makes it possible to read mulitple fields in one line.
#
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only --field-separator=, --no-align -c"

SHOW_ELEMENT()
{
  local ATOMIC_NUMBER=$1

  RESULT="$($PSQL "SELECT symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements AS e INNER JOIN properties AS p ON e.atomic_number = p.atomic_number INNER JOIN types AS t ON p.type_id = t.type_id WHERE e.atomic_number = $1;")"

  echo "$RESULT" | while IFS=',' read ELEMENT_SYMBOL ELEMENT_NAME ATOMIC_MASS MELTING_PT BOILING_PT METAL_TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $METAL_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_PT celsius and a boiling point of $BOILING_PT celsius."
  done
}

ELEMENT_NOT_FOUND()
{
  echo "I could not find that element in the database."
}

INPUT="$1"

if [[ -z $INPUT ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $INPUT =~ ^[-]?[0-9]+$ ]]
  then
    MIN_ATOMIC_NUMBER="$($PSQL "SELECT MIN(atomic_number) FROM elements;")"
    MAX_ATOMIC_NUMBER="$($PSQL "SELECT MAX(atomic_number) FROM elements;")"

    if [[ $MIN_ATOMIC_NUMBER -le $INPUT && $INPUT -le $MAX_ATOMIC_NUMBER ]]
    then
      SHOW_ELEMENT $INPUT
    else
      ELEMENT_NOT_FOUND
    fi

  elif [[ ${#INPUT} -le 2 ]]
  then
    # Use the symbol to find the atomic number.
    ATOMIC_NUMBER="$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$INPUT';")"
    if [[ ! -z $ATOMIC_NUMBER ]]
    then
      SHOW_ELEMENT $ATOMIC_NUMBER
    else
      ELEMENT_NOT_FOUND
    fi
  else
    # Use the name
    ATOMIC_NUMBER="$($PSQL "SELECT atomic_number FROM elements WHERE name = '$INPUT';")"
    if [[ ! -z $ATOMIC_NUMBER ]]
    then
      SHOW_ELEMENT $ATOMIC_NUMBER
    else
      ELEMENT_NOT_FOUND
    fi
  fi

fi
