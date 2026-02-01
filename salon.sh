#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU()
{
  if [[ -z $1 ]]
  then
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  else
    echo -e "\n$1"
  fi

  SERVICES="$($PSQL "SELECT service_id, name FROM services;")"
  echo "$SERVICES" | while IFS=' | ' read SERVICE_ID SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done

  read SERVICE_ID_SELECTED
  RESULT="$($PSQL  "SELECT service_id FROM services WHERE service_id IN ('$SERVICE_ID_SELECTED');")"
  if [[ -z $RESULT ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # search for existence of the phone
    CUSTOMER_ID="$($PSQL  "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")"
    # phone doesn't exist
    if [[ -z $CUSTOMER_ID ]]
    then
      # ask for name and add to database
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      RESULT="$($PSQL  "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")"

    else
      CUSTOMER_NAME="$($PSQL  "SELECT name FROM customers WHERE customer_id = '$CUSTOMER_ID';")"
    fi

    # Get the time
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    RESULT="$($PSQL  "INSERT INTO appointments (time, customer_id, service_id) VALUES ('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED);")"
    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME.\n"
  fi
}

echo -e "\n~~~~~ MY SALON ~~~~~"
MAIN_MENU
