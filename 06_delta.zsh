_apply_delta_terre_braise() {
    if [[ "$TERRE_BRAISE_MODE" == 'dark' ]]; then
        export DELTA_FEATURES='braise-sombre'
    else
        export DELTA_FEATURES='terre-claire'
    fi
}

_apply_delta_terre_braise
