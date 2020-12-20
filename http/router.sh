##
# Load controllers
##
source ./providers/routing.sh

##
# Route the request to the appropriate place
##
function router.route {
    ROUTE="${1}"
    METHOD="${2}"

    case "${METHOD}:${ROUTE}" in
        GET:/hello)
            controller.helloWorld.success
            ;;
        GET:/hello/forbidden)
            controller.helloWorld.forbidden
            ;;
        *)
            dispatch.notFound
            ;;
    esac
}