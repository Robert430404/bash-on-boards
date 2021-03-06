#!/usr/bin/bash

##
# Kick off the wizard
##
echo "What is your controller name?"

# Request the controller name
read -r CONTROLLER

# Parse the file name and file location
LOWER=${CONTROLLER,,}
FILENAME="${LOWER}.sh"
FILE="${PWD}/http/controllers/${FILENAME}"

# create the controller file
touch "${FILE}"

# Output scaffolded file
echo "\
#!/bin/bash

function controller.${LOWER}.get {
  # Intended to be bound to a GET route
  return
}

function controller.${LOWER}.create {
  # Intended to be bound to a POST route
  return
} 

function controller.${LOWER}.update {
  # Intended to be bound to a PUT route
  return
} 

function controller.${LOWER}.delete {
  # Intended to be bound to a DELETE route
  return
} 
" > "${FILE}"

# Add it to the provider
PROVIDER="${PWD}/providers/routing.sh"

# make sure there is no trailing white space
if [[ $(tail -c1 "${PROVIDER}" | wc -l) == 1 ]]; then
  head -c -1 "${PROVIDER}" > "${PROVIDER}.tmp"
  mv "${PROVIDER}.tmp" "${PROVIDER}"
fi

# append the controller
echo "
source ./http/controllers/${FILENAME}" >> "${PWD}/providers/routing.sh"

echo "Controller created!"