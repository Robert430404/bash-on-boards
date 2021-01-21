#!/usr/bin/bash

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

  echo "Whats your table name?"

  read -r TABLE_NAME

  declare -A MIGRATION_FIELDS

  function getField {
    echo "Enter field name: [ex. example_name]"
    read -r FIELD

    echo "Enter field type: [ex. varchar(60)]"
    read -r TYPE

    MIGRATION_FIELDS["$FIELD"]="$TYPE"
    
    echo "Add another field? [yes, no]"
    read -r CONFIRMATION

    if [[ "${CONFIRMATION}" == "yes" ]]; then
      getField
    fi
  }

  getField

  SQL_STRING="CREATE TABLE IF NOT EXISTS ${TABLE_NAME} ("

  for key in "${!MIGRATION_FIELDS[@]}"; do
    SQL_STRING="${SQL_STRING} ${key} ${MIGRATION_FIELDS[$key]}"
  done

  SQL_STRING="${SQL_STRING} );"

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

  PROVIDER="./db/migrations/migrate.sh"

  # make sure there is no trailing white space
  if [[ $(tail -c1 "${PROVIDER}" | wc -l) == 1 ]]; then
    head -c -1 "${PROVIDER}" > "${PROVIDER}.tmp"
    mv "${PROVIDER}.tmp" "${PROVIDER}"
  fi

  echo "
source ${FILE_PATH}" >> "${PROVIDER}"

  exit 0
fi

if [[ "${CONFIRMATION}" == "yes" && "${ACTION}" == "${MIGRATE_ACTION}" ]]; then
  echo "Running the migrations."

  source ./db/migrations/migrate.sh

  exit 0
fi

exit 0