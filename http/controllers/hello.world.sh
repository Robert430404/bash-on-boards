function controller.helloWorld {
    echo "Controller for the hello world application"
}

function controller.helloWorld.success {
    dispatch.success "You can be here!"
}

function controller.helloWorld.forbidden {
    dispatch.forbidden "You can't be here!"
}
