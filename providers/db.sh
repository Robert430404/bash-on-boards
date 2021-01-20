#!/usr/bin/bash

##
# Load in your DB driver
##
source ./db/drivers/sqlite.sh

##
# Register models with the application
##
source ./db/models/baseModel.sh

##
# Register repositories with the application
##
source ./db/repositories/baseRepository.sh