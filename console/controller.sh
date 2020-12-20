#!/usr/bin/bash

##
# Make sure we run the server from the proper directory
##
WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "${WORKING_DIR}"

echo "What is your controller name?"
read CONTROLLER

LOWER=${CONTROLLER,,}
FILENAME="${LOWER}.sh"
FILE="${PWD}/../http/controllers/${FILENAME}"

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

if [[ $(tail -c1 ${PROVIDER} | wc -l) == 1 ]]; then
  head -c -1 ${PROVIDER} > ${PROVIDER}.tmp
  mv ${PROVIDER}.tmp ${PROVIDER}
fi

echo "
source ./http/controllers/${FILENAME}" >> "${PWD}/../providers/routing.sh"

echo "Controller created!"