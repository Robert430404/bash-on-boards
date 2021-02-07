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
else
  dialogs.echoAndExit "Invalid action requested."
fi

# if [[ "${CONFIRMATION}" == "yes" && "${ACTION}" == "${CREATE_ACTION}" ]]; then
#   echo "Creating a new migration file."

#   echo "Whats your table name?"

#   read -r TABLE_NAME

#   declare -A MIGRATION_FIELDS

#   function getField {
#     echo "Enter field name: [ex. example_name]"
#     read -r FIELD

#     echo "Enter field type: [ex. varchar(60)]"
#     read -r TYPE

#     MIGRATION_FIELDS["$FIELD"]="$TYPE"
    
#     echo "Add another field? [yes, no]"
#     read -r CONFIRMATION

#     if [[ "${CONFIRMATION}" == "yes" ]]; then
#       getField
#     fi
#   }

#   getField

#   SQL_STRING="CREATE TABLE IF NOT EXISTS ${TABLE_NAME} ("

#   for key in "${!MIGRATION_FIELDS[@]}"; do
#     SQL_STRING="${SQL_STRING} ${key} ${MIGRATION_FIELDS[$key]}"
#   done

#   SQL_STRING="${SQL_STRING} );"

#   EPOCH=$(date +%s)
#   FILE_NAME="${EPOCH}.migration.sh"
#   FILE_PATH="./db/migrations/${FILE_NAME}"

#   touch "${FILE_PATH}"

#   echo "\
# #!/bin/bash

# source ./config/config.sh

# function ${EPOCH}.migrate {
#   echo 'running ${FILE_NAME}'

#   sqlite3 \${DB_FILE} \"${SQL_STRING}\"

#   return
# }

# ${EPOCH}.migrate
# " >> "${FILE_PATH}"

#   PROVIDER="./db/migrations/migrate.sh"

#   # make sure there is no trailing white space
#   if [[ $(tail -c1 "${PROVIDER}" | wc -l) == 1 ]]; then
#     head -c -1 "${PROVIDER}" > "${PROVIDER}.tmp"
#     mv "${PROVIDER}.tmp" "${PROVIDER}"
#   fi

#   echo "
# source ${FILE_PATH}" >> "${PROVIDER}"

#   exit 0
# fi

# if [[ "${CONFIRMATION}" == "yes" && "${ACTION}" == "${RUN_ACTION}" ]]; then
#   echo "Running the migrations."

#   source ./db/migrations/migrate.sh

#   exit 0
# fi

# exit 0