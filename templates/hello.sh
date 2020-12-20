source ./templates/layouts/base.sh

function templates.hello.success {
    templates.layouts.base "\
        <h1>Hello World</h1>
        <p>Bash On Boards does indeed give you HTML rendering!</p>
"
}