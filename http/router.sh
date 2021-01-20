#!/usr/bin/bash

##
# Route the request to the appropriate place
##
function router.route {
    local ROUTE="${1}"
    local METHOD="${2}"
    local HANDLER=${ROUTES_MAP[$METHOD:$ROUTE]}

    if [[ -n $HANDLER ]]; then
        $HANDLER

        return;
    fi
    
    # Dispatch a not found by default
    renderer.json.notFound '{
        "status": "not found",
        "handler": "default renderer call in router.sh"
    }'
}