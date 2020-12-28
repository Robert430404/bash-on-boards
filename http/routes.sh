# Expose the route map
declare -A ROUTES_MAP

# Register routes
ROUTES_MAP[GET:/home]="controller.helloWorld.success"
ROUTES_MAP[GET:/hello/forbidden]="controller.helloWorld.forbidden"
