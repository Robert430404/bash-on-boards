##
# Load controllers
##
source ./http/controllers/hello.world.sh

function router.route {
    ROUTE="${1}"

    case ${ROUTE} in
        /api/v1/hello)
            controller.helloWorld.success
            ;;
        /api/v1/hello/forbidden)
            controller.helloWorld.forbidden
            ;;
        *)
            dispatch.notFound
            ;;
    esac
}