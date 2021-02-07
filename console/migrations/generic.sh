#!/usr/bin/bash

##
# Creates the create table string for the migration
##
function migrations.generic {
  local WHILE_STRING
  local EPOCH
  local FILE_NAME
  local FILE_PATH

  WHILE_STRING="doing"

  dialogs.echoLine "Creating a new migration file."

  # Convert all of this into the actual migration
  EPOCH=$(date +%s)
  FILE_NAME="${EPOCH}.migration.sh"
  FILE_PATH="./db/migrations/${FILE_NAME}"

  touch "${FILE_PATH}"

  echo "\
#!/bin/bash

source ./config/config.sh

function ${EPOCH}.migrate {
  echo 'running ${FILE_NAME}'

  sqlite3 \${DB_FILE} \"Enter your SQL Statements here\"

  return
}

${EPOCH}.migrate
" >> "${FILE_PATH}"

  # Add the new migration to the provider
  PROVIDER="./db/migrations/migrate.sh"

  # make sure there is no trailing white space
  if [[ $(tail -c1 "${PROVIDER}" | wc -l) == 1 ]]; then
    head -c -1 "${PROVIDER}" > "${PROVIDER}.tmp"
    mv "${PROVIDER}.tmp" "${PROVIDER}"
  fi

  echo "
source ${FILE_PATH}" >> "${PROVIDER}"

  exit 0
}
