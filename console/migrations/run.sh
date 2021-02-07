#!/usr/bin/bash

function migrations.run {
  # Alert the user
  dialogs.echoLine "Running the migrations."

  # Source the provider - It sources all of the self executing migration files
  source ./db/migrations/migrate.sh

  # Exit the script
  exit 0
}