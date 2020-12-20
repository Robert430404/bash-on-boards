source ./templates/layout.sh

function templates.hello.success {
    templates.layout.base "\
        <h1>Hello World</h1>
        <p>Bash On Boards does indeed give you HTML rendering!</p>
"
}