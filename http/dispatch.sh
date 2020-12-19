function dispatch {
    echo "class for dispatching HTTP responses"
}

function dispatch.success {
    local CONTENTS=${1}

    echo "success: ${CONTENT}"
}

function dispatch.forbidden {
    local CONTENTS=${1}

    echo "foridden: ${CONTENT}"
}

function dispatch.notFound {
    local CONTENTS=${1}

    echo "not found: ${CONTENT}"
}