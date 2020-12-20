function renderer.html {
    local CONTENTS=${1}

    dispatch.success "${CONTENTS}" "text/html"
}

function renderer.html.forbidden {
    local CONTENTS=${1}

    dispatch.forbidden "${CONTENTS}" "text/html"
}

function renderer.notFound {
    local CONTENTS=${1}

    dispatch.notFound "${CONTENTS}" "text/html"
}

function renderer.text {
    local CONTENTS=${1}

    dispatch.success "${CONTENTS}" "text"
}

function renderer.text.forbidden {
    local CONTENTS=${1}

    dispatch.forbidden "${CONTENTS}" "text"
}

function renderer.text.notFound {
    local CONTENTS=${1}

    dispatch.notFound "${CONTENTS}" "text"
}