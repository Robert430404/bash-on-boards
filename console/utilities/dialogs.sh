#!/bin/bash

##
# Outputs a new lint
##
function dialogs.echoLine {
  local MESSAGE

  MESSAGE="${1}"

  echo
  echo "${MESSAGE}"
}

function dialogs.echoAndExit {
  local MESSAGE

  MESSAGE="${1}"

  dialogs.echoLine "${MESSAGE}"

  echo 0
}

##
# Confirms the users intentions
##
function dialogs.confirm {
  local CONFIRM_STRING
  local DENY_STRING
  local MESSAGE

  CONFIRM_STRING="yes"
  DENY_STRING="no"
  MESSAGE="${1}"

  dialogs.echoLine "${MESSAGE} [${CONFIRM_STRING}/${DENY_STRING}]"

  read -r CONFIRMATION

  if [[ "${CONFIRMATION}" != "${CONFIRM_STRING}" ]]; then
    dialogs.echoLine "Stopping execution..."

    exit 0
  fi
}