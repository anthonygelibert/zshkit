gi() {
  command -v curl >/dev/null || { print -r -- "curl requis" >&2; return 127; }
  if [[ -z "$*" ]]; then
    print -r -- "Usage: gi <lang1,lang2,...>" >&2; return 2
  fi
  curl -fsSL --compressed "https://www.gitignore.io/api/$*"
}

_gitignoreio_get_command_list() {
  local cache="${XDG_CACHE_HOME}/zsh/gi.list"
  mkdir -p "${cache:h}"
  if [[ ! -s "$cache" || $((EPOCHSECONDS - $(stat -f %m "$cache" 2>/dev/null || echo 0))) -gt 86400 ]]; then
    curl -fsSL --compressed https://www.gitignore.io/api/list | tr ',' '\n' >| "$cache" || return
  fi
  cat "$cache"
}

_gitignoreio() {
  compset -P '*,'
  compadd -S '' -- $(_gitignoreio_get_command_list)
}
compdef _gitignoreio gi
