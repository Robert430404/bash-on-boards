# Bash On Boards

This is an MVC Web Framework writtein in bash... because why not?

## Getting Started

To start the server you can simply run `./server.sh`  in a bash terminal 
and it starts up the application.

> Please note that all paths in the application are done from the `server.sh` root

## Application Configuration

It operates on a `/./config/config.sh` file that's included when the 
application bootstraps itself.

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