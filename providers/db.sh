#!/usr/bin/bash

##
# Load in your DB driver
##
if [[ "${DB_DRIVER}" == "sqlite" ]]; then
  source ./db/drivers/sqlite.sh
fi

##
# Register models with the application
##
source ./db/models/baseModel.sh

##
# Register repositories with the application
##
source ./db/repositories/baseRepository.sh