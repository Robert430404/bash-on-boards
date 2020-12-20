#!/usr/bin/bash

##
# Make sure we run the server from the proper directory
##
WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "${WORKING_DIR}"

##
# Kick off the wizard
##
echo "What is your controller name?"

# Request the controller name
read CONTROLLER

# Parse the file name and file location
LOWER=${CONTROLLER,,}
FILENAME="${LOWER}.sh"
FILE="${PWD}/../http/controllers/${FILENAME}"

# create the controller file
touch "${FILE}"

# Output scaffolded file
echo "\
function controller.${LOWER}.get {
    # Intended to be bound to a GET route
}

function controller.${LOWER}.create {
    # Intended to be bound to a POST route
} 

function controller.${LOWER}.update {
    # Intended to be bound to a PUT route
} 

function controller.${LOWER}.delete {
    # Intended to be bound to a DELETE route
} 
" > "${FILE}"

# Add it to the provider
PROVIDER="${PWD}/../providers/routing.sh"

# make sure there is no trailing white space
if [[ $(tail -c1 ${PROVIDER} | wc -l) == 1 ]]; then
  head -c -1 ${PROVIDER} > ${PROVIDER}.tmp
  mv ${PROVIDER}.tmp ${PROVIDER}
fi

# append the controller
echo "
source ./http/controllers/${FILENAME}" >> "${PWD}/../providers/routing.sh"

echo "Controller created!"