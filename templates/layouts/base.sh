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

    echo "\
${HEADER}
${INNER}
${FOOTER}
"
}