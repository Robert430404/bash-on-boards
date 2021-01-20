#!/usr/bin/bash

##
# Load the dependencies for the template
##
source ./templates/chrome/header.sh
source ./templates/chrome/footer.sh

##
# Render the base template
##
function templates.layouts.base {
    local INNER="${1}"

    # Define the vars
    local HEADER
    local FOOTER
    local BASE_CSS

    # Assign to avoid masking bad return
    HEADER=$(templates.chrome.header)
    FOOTER=$(templates.chrome.footer)
    BASE_CSS=$(cat ./templates/styles/base.css)

    echo "\
<!DOCTYPE html>
<html>
<head>
    <title>Base Template Pages</title>

    <style>
        ${BASE_CSS}
    </style>
</head>

<body>
    <section class=\"Wrapper\">
        ${HEADER}

        ${INNER}

        ${FOOTER}
    </section>
</body>
"
}