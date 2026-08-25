# Keep all terminal tools synchronized with the current macOS appearance.
_sync_terre_braise_appearance() {
    local new_mode='light'
    [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == 'Dark' ]] && new_mode='dark'

    [[ "$new_mode" == "$TERRE_BRAISE_MODE" ]] && return

    export TERRE_BRAISE_MODE="$new_mode"
    export EZA_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/eza/${new_mode}"

    (( $+functions[_apply_delta_terre_braise] )) && _apply_delta_terre_braise
    (( $+functions[_apply_fzf_terre_braise] )) && _apply_fzf_terre_braise
}

_sync_terre_braise_appearance

autoload -Uz add-zsh-hook
add-zsh-hook -d precmd _sync_terre_braise_appearance 2>/dev/null
add-zsh-hook precmd _sync_terre_braise_appearance
