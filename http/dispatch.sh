##
# Handles dispatch for HTTP requests.
##
function dispatch {
    echo "class for dispatching HTTP responses"
}

##
# Dispatches a successful response
##
function dispatch.success {
    local CONTENTS=${1:-\{\"status\": \"success\"\}}
    local CONTENT_TYPE="${2:-application/json}"

    echo "\
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: $((${#CONTENTS} + 2))
Content-Type: ${CONTENT_TYPE}

${CONTENTS}
"
}

##
# Dispathces a forbidden response
##
function dispatch.forbidden {
    local CONTENTS=${1:-\{\"status\": \"forbidden\"\}}
    local CONTENT_TYPE="${2:-application/json}"

    echo "\
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: $((${#CONTENTS} + 2))
Content-Type: ${CONTENT_TYPE}

${CONTENTS}
"
}

##
# Dispatches a not found response
##
function dispatch.notFound {
    local CONTENTS=${1:-\{\"status\": \"not found\"\}}
    local CONTENT_TYPE=${2:-application/json}

    echo "\
HTTP/1.1 404 NOT FOUND
Connection: keep-alive
Content-Length: $((${#CONTENTS} + 2))
Content-Type: ${CONTENT_TYPE}

${CONTENTS}
"
}
