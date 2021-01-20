#!/usr/bin/bash

##
# Make sure we run the server from the proper directory
##
WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "${WORKING_DIR}" || exit 1

CREATE_ACTION="create"
MIGRATE_ACTION="run"

##
# Kick off the wizard
##
echo "What do you want to do? [${CREATE_ACTION}, ${MIGRATE_ACTION}]"

read -r ACTION

if [[ "${ACTION}" == "${CREATE_ACTION}" ]]; then
  echo "Are you sure you want to create a new migration? [yes, no]"
elif [[ "${ACTION}" == "${MIGRATE_ACTION}" ]]; then
  echo "Are you sure you want to run migrations? [yes, no]"
else
  echo "Invalid action requested."
  exit 0
fi

read -r CONFIRMATION

if [[ "${CONFIRMATION}" == "no" ]]; then
  echo "Canceling the action"
  exit 0
fi

if [[ "${CONFIRMATION}" == "yes" && "${ACTION}" == "${CREATE_ACTION}" ]]; then
  echo "Creating a new migration file."
fi

if [[ "${CONFIRMATION}" == "yes" && "${ACTION}" == "${MIGRATE_ACTION}" ]]; then
  echo "Running the migrations."

  source ./../db/migrations/migrate.sh
fi

exit 0