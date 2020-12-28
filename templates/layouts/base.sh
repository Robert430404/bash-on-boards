##
# Load the dependencies for the template
##
source ./templates/chrome/header.sh
source ./templates/chrome/footer.sh

##
# Render the base template
##
function templates.layouts.base {
    local INNER=${1}
    local HEADER=`templates.chrome.header`
    local FOOTER=`templates.chrome.footer`
    local BASE_CSS=`cat ./templates/styles/base.css`

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