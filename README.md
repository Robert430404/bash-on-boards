# Bash On Boards

This is an MVC Web Framework written in bash... because why not?

## Getting Started

First things first, copy the `./config/config.examples.sh` to
`./config/config.sh` using the following command from the project root.

```bash
cp ./config/config.examples.sh ./config/config.sh
```

Once you have the configuration file copied from the template, adjust the
values to your requirements.

To start the server you can simply run `./server.sh`  in a bash terminal 
and it starts up the application.

## Building With Bash On Boards

> Please note that all paths in the application are done from the `server.sh` root

To start building, you can create your own routes and controllers. There
are a suite of console tools to help you generate boiler plate.

You can run the scripts by executing them from the root of the project.
They then launch a wizard and walk you through the rest of the process.

```bash
# Creates a controller file with all methods
./console/controller.sh
```

## Registering Routes

In `./http/router.sh` you can register routes to execute specific bash
functions. Typically you'll bind the route to a controller method. To
register new routes, add a new case to the `./http/router.sh` and call
the function from inside of your controller.

```bash
##
# Load controllers
##
source ./http/controllers/your.controller.sh

function router.route {
    ROUTE="${1}"
    METHOD="${2}"

    case "${METHOD}:${ROUTE}" in
        GET:/api/v1/your-route)
            controller.yourController.routeMethod
            ;;
    esac
}
```