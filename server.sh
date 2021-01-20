#!/usr/bin/bash

##
# Make sure we run the server from the proper directory
##
WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "${WORKING_DIR}" || exit 1

##
# Load the config file for the application
##
source ./config/config.sh

##
# Load the application
##
source ./app.sh

##
# Make sure we only have one instance running
##
rm -f out
mkfifo out
trap "rm -f out" EXIT

##
# Kick off the loop for listening
##
while true; do
  ##
  # Cat the output of netcat and capture it for parsing
  ##
  cat out | nc -l "${PORT}" > >(
    # Export so we can reassign as we iterate
    export ROUTE=
    export METHOD=

    # Start parsing the lines
    while read -r line; do
      # Grab the current line from netcat
      line=$(echo "$line" | tr -d '\r\n')

      # Match up the method, and parse the route
      if echo "$line" | grep -qE '^GET /'; then
        ROUTE=$(echo "$line" | cut -d ' ' -f2)
        METHOD=GET
      elif echo "$line" | grep -qE '^POST /'; then
        ROUTE=$(echo "$line" | cut -d ' ' -f2)
        METHOD=POST
      elif echo "$line" | grep -qE '^PUT /'; then
        ROUTE=$(echo "$line" | cut -d ' ' -f2)
        METHOD=PUT
      elif echo "$line" | grep -qE '^DELETE /'; then
        ROUTE=$(echo "$line" | cut -d ' ' -f2)
        METHOD=DELETE
      elif [ -z "$line" ]; then
        router.route "${ROUTE}" "${METHOD}" > out
      fi
    done
  )
done