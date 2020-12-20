##
# Load dependencies
#
# We're loading the base layout
##
source ./templates/layouts/base.sh

##
# The template for the hello controller
##
function templates.hello.success {
    templates.layouts.base "\
        <h1>Hello World</h1>
        <p>Bash On Boards does indeed give you HTML rendering!</p>
"
}