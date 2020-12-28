##
# Route the request to the appropriate place
##
function router.route {
    local ROUTE="${1}"
    local METHOD="${2}"

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