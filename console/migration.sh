#!/usr/bin/bash

##
# Source script dependencies
##
source console/utilities/dialogs.sh

source console/migrations/createTable.sh
source console/migrations/generic.sh
source console/migrations/run.sh

##
# Parent actions
##
HELP_ACTION="help"
RUN_ACTION="run"
CREATE_ACTION="create"

##
# Child actions
##
CREATE_TABLE_ACTION="table"
CREATE_GENERIC_ACTION="generic"

##
# Refrsh your terminal session
##
clear

##
# Kick off the wizard
##
dialogs.echoLine "What do you want to do?

    ${CREATE_ACTION} - Walks you through making a new migration
    ${RUN_ACTION}    - Runs your existing migrations
"

read -r ACTION

if [[ "${ACTION}" == "${HELP_ACTION}" ]]; then
  dialogs.echoAndExit "Help dialog here"
elif [[ "${ACTION}" == "${RUN_ACTION}" ]]; then
  dialogs.confirm "Are you sure you want to run migrations?"

  migrations.run
elif [[ "${ACTION}" == "${CREATE_ACTION}" ]]; then
  dialogs.confirm "Are you sure you want to create a new migration?"

  dialogs.echoLine "What kind of migration do you want?

    ${CREATE_TABLE_ACTION}   - Launches the wizard to make a new table 
    ${CREATE_GENERIC_ACTION} - Creates a shell migration that you fill in
"

  read -r SUB_ACTION

  if [[ "${SUB_ACTION}" == "${CREATE_TABLE_ACTION}" ]]; then
    migrations.createTable
  fi

  if [[ "${SUB_ACTION}" == "${CREATE_GENERIC_ACTION}" ]]; then
    migrations.generic
  fi
else
  dialogs.echoAndExit "Invalid action requested."
fi
