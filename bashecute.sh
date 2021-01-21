#!/usr/bin/bash

##
# Make sure we run the server from the proper directory
##
WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "${WORKING_DIR}" || exit 1

COMMAND="${1}"

if [[ "${COMMAND}" == "help" || "${COMMAND}" == "" ]]; then
  echo "
Available commands:

  help - Prints this message
    ex. bashecute.sh help

  controller - Runs the controller script to scaffold controllers
    ex. bashecute.sh controller

  lint - Lints the application
    ex. bashecute.sh lint

  seeder - Helps you generate a seed, or run the seeder
    ex. bashecute.sh seeder

  migration - Helps you generate a migration, or run the migrations
    ex. bashecute.sh migration
"

  exit 0
fi

if [[ "${COMMAND}" == "lint" ]]; then
  ./console/lint.sh

  exit 0
fi

if [[ "${COMMAND}" == "controller" ]]; then
  ./console/controller.sh

  exit 0
fi

if [[ "${COMMAND}" == "migration" ]]; then
  ./console/migration.sh

  exit 0
fi

if [[ "${COMMAND}" == "seeder" ]]; then
  ./console/seeder.sh

  exit 0
fi