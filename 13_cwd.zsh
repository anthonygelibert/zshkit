update_terminal_cwd() {
    if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
        local SEARCH=' '
        local REPLACE='%20'
        local PWD_URL="file://$HOST${PWD//$SEARCH/$REPLACE}"
        printf '\e]7;%s\a' "$PWD_URL"
    fi
}

if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
    autoload add-zsh-hook
    add-zsh-hook chpwd update_terminal_cwd
    update_terminal_cwd
fi
