#!/usr/bin/bash

##
# Make sure we run the server from the proper directory
##
WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "${WORKING_DIR}"

##
# Load the config file for the application
##
source ./config/config.sh

##
# Load the application
##
source ./app.sh

rm -f out

mkfifo out

trap "rm -f out" EXIT

while true; do
  cat out | nc -l "${PORT}" > >(
    export ROUTE=
    export METHOD=

    while read -r line; do
      line=$(echo "$line" | tr -d '\r\n')

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
        router.route ${ROUTE} ${METHOD} > out
      fi
    done
  )
done