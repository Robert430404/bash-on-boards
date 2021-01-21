#!/usr/bin/bash

##
# Insert a record into the database
##
function db.drivers.insert {
  sqlite3 "${DB_FILE}"
}

##
# Find a record in the database
##
function db.drivers.find {
  sqlite3 "${DB_FILE}"
}

##
# Find all records in the database
##
function db.drivers.findAll {
  sqlite3 "${DB_FILE}"
}

##
# Update a record in the database
##
function db.drivers.update {
  sqlite3 "${DB_FILE}"
}

##
# Delete a record from the database
##
function db.drivers.delete {
  sqlite3 "${DB_FILE}"
}