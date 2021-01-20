#!/usr/bin/bash

##
# Handles dispatch for HTTP requests.
##
function dispatch {
    echo "class for dispatching HTTP responses"
}

##
# Dispatches a request
##
function dispatch.request {
    local STATUS_CODE=${1}
    local CONTENTS=${2}
    local CONTENT_TYPE=${3}
    
    echo "\
HTTP/1.1 ${STATUS_CODE}
Connection: keep-alive
Content-Length: $((${#CONTENTS} + 2))
Content-Type: ${CONTENT_TYPE}

${CONTENTS}
"
}

##
# Dispatches a successful response
##
function dispatch.success {
    local CONTENTS=${1:-\{\"status\": \"success\"\}}
    local CONTENT_TYPE="${2:-application/json}"

    dispatch.request "200 OK" "${CONTENTS}" "${CONTENT_TYPE}"
}

##
# Dispathces a bad request response
##
function dispatch.badRequest {
    local CONTENTS=${1:-\{\"status\": \"bad request\"\}}
    local CONTENT_TYPE="${2:-application/json}"

    dispatch.request "400 BAD REQUEST" "${CONTENTS}" "${CONTENT_TYPE}"
}

##
# Dispathces an unauthorized response
##
function dispatch.unauthorized {
    local CONTENTS=${1:-\{\"status\": \"bad request\"\}}
    local CONTENT_TYPE="${2:-application/json}"

    dispatch.request "401 UNAUTHORIZED" "${CONTENTS}" "${CONTENT_TYPE}"
}

##
# Dispathces a forbidden response
##
function dispatch.forbidden {
    local CONTENTS=${1:-\{\"status\": \"forbidden\"\}}
    local CONTENT_TYPE="${2:-application/json}"

    dispatch.request "403 FORBIDDEN" "${CONTENTS}" "${CONTENT_TYPE}"
}

##
# Dispatches a not found response
##
function dispatch.notFound {
    local CONTENTS=${1:-\{\"status\": \"not found\"\}}
    local CONTENT_TYPE=${2:-application/json}

    dispatch.request "404 NOT FOUND" "${CONTENTS}" "${CONTENT_TYPE}"
}
