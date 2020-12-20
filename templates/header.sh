function templates.header.header {
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
"
}