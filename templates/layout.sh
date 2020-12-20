source ./templates/header.sh
source ./templates/footer.sh

function templates.layout.base {
    local INNER=${1}
    local HEADER=`templates.header.header`
    local FOOTER=`templates.footer.footer`

    echo "\
${HEADER}
${INNER}
${FOOTER}
"
}