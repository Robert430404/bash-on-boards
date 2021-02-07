#!/usr/bin/bash

##
# Creates the create table string for the migration
##
function migrations.createTable {
  local WHILE_STRING
  local SQL_STRING
  local EPOCH
  local FILE_NAME
  local FILE_PATH

  WHILE_STRING="doing"

  dialogs.echoLine "Creating a new migration file."
  dialogs.echoLine "Whats your table name?"

  read -r TABLE_NAME

  declare -A MIGRATION_FIELDS

  # Collect the migration fields and types
  while [[ "${WHILE_STRING}" == "doing" ]]; do
    clear

    echo "Enter field name: [ex. example_name]"
    read -r FIELD

    echo "Enter field type: [ex. varchar]"
    read -r TYPE

    MIGRATION_FIELDS["$FIELD"]="$TYPE"
    
    echo "Add another field? [yes, no]"
    read -r CONFIRMATION

    if [[ "${CONFIRMATION}" != "yes" ]]; then
      WHILE_STRING="done"
    fi
  done

  # Build the SQL string
  SQL_STRING="CREATE TABLE IF NOT EXISTS ${TABLE_NAME} ("

  for key in "${!MIGRATION_FIELDS[@]}"; do
    SQL_STRING="${SQL_STRING} ${key} ${MIGRATION_FIELDS[$key]}"
  done

  SQL_STRING="${SQL_STRING} );"

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

  sqlite3 \${DB_FILE} \"${SQL_STRING}\"

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
