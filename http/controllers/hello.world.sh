##
# Source dependencies
##
source ./templates/hello.sh

function controller.helloWorld {
    echo "Controller for the hello world application"
}

function controller.helloWorld.success {
    local TEMPLATE=`templates.hello.success`

    renderer.html "${TEMPLATE}"
}

function controller.helloWorld.forbidden {
    renderer.text.forbidden "You can't be here!"
}
