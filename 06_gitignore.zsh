zmodload zsh/datetime

gi() {
    if (( $# == 0 )); then
        print -u2 -- 'Usage: gi <lang1> [lang2...]'
        return 2
    fi

    local templates="${(j:,:)@}"

    command curl -fsSL --compressed \
        "https://www.toptal.com/developers/gitignore/api/${templates}"
}

_gitignoreio_get_command_list() {
    local cache="${XDG_CACHE_HOME}/zsh/gi.list"
    local tmp="${cache}.tmp.$$"
    local list
    local -i mtime=0

    mkdir -p "${cache:h}"

    if [[ -s "$cache" ]]; then
        mtime=$(command stat -f %m "$cache" 2>/dev/null)
    fi

    if [[ ! -s "$cache" ]] ||
       (( EPOCHSECONDS - mtime > 86400 )); then
        list=$(
            command curl -fsSL --compressed \
                'https://www.toptal.com/developers/gitignore/api/list'
        ) || return

        print -r -- "${list//,/$'\n'}" >| "$tmp" || return

        command mv -f -- "$tmp" "$cache"
    fi

    command cat -- "$cache"
}

_gitignoreio() {
    local output

    compset -P '*,'
    output=$(_gitignoreio_get_command_list) || return
    compadd -S '' -- ${(f)output}
}

compdef _gitignoreio gi
