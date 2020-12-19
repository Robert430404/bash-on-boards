function dispatch {
    echo "class for dispatching HTTP responses"
}

function dispatch.success {
    local CONTENTS=${1}

    echo "\
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: $((${#CONTENTS} + 2))

${CONTENTS}
"
}

function dispatch.forbidden {
    local CONTENTS=${1:-Forbidden}

    echo "\
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: $((${#CONTENTS} + 2))

${CONTENTS}
"
}

function dispatch.notFound {
    local CONTENTS=${1:-Not Found}

    echo "\
HTTP/1.1 404 NOT FOUND
Connection: keep-alive
Content-Length: $((${#CONTENTS} + 2))

${CONTENTS}
"
}