##
# Source dependencies
##
source ./templates/hello.sh

##
# Constructor
##
function controller.helloWorld {
    echo "Controller for the hello world application"
}

##
# Success method for the hello world controller
##
function controller.helloWorld.success {
    local TEMPLATE=`templates.hello.success`

    renderer.html "${TEMPLATE}"
}

##
# Forbidden method for the hello world controller
##
function controller.helloWorld.forbidden {
    renderer.text.forbidden "You can't be here!"
}
