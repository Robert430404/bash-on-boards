#!/usr/bin/bash

##
# Render a successful HTML response
##
function renderer.html {
    local CONTENTS=${1}

    dispatch.success "${CONTENTS}" "text/html"
}

##
# Render a forbidden HTML response
##
function renderer.html.forbidden {
    local CONTENTS=${1}

    dispatch.forbidden "${CONTENTS}" "text/html"
}

##
# Render a not found HTML response
##
function renderer.notFound {
    local CONTENTS=${1}

    dispatch.notFound "${CONTENTS}" "text/html"
}

##
# Render a successful text response
##
function renderer.text {
    local CONTENTS=${1}

    dispatch.success "${CONTENTS}" "text"
}

##
# Render a forbidden text response
##
function renderer.text.forbidden {
    local CONTENTS=${1}

    dispatch.forbidden "${CONTENTS}" "text"
}

##
# Render a not found text response
##
function renderer.text.notFound {
    local CONTENTS=${1}

    dispatch.notFound "${CONTENTS}" "text"
}

##
# Render a successful JSON response
##
function renderer.json {
    local CONTENTS=${1}

    dispatch.success "${CONTENTS}" "application/json"
}

##
# Render a forbidden JSON response
##
function renderer.json.forbidden {
    local CONTENTS=${1}

    dispatch.forbidden "${CONTENTS}" "application/json"
}

##
# Render a not found JSON response
##
function renderer.json.notFound {
    local CONTENTS=${1}

    dispatch.notFound "${CONTENTS}" "application/json"
}