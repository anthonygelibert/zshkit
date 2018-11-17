# vim: ft=zsh

export PYTHONPATH="$C/Recherche/AQiT/Code/aqit-map"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export WORKON_HOME="${P}/pyvenvs/"
export IPYTHONDIR="${XDG_CONFIG_HOME}/python/ipython"

function python_dev() {
    export PYTHONUNBUFFERED="enable"
    export PYTHONUTF8="1"
    export PYTHONWARNINGS="default"
    export PYTHONDEVMODE="enable"
    export PYTHONASYNCIODEBUG="enable"
    export PYTHONFAULTHANDLER="enable"
}

function python_debug() {
    export PYTHONINSPECT="enable"
    export PYTHONVERBOSE="enable"
    export PYTHONPROFILEIMPORTTIME="enable"
}

function python_mem_debug() {
    export PYTHONTRACEMALLOC="enable"
    export PYTHONMALLOC="pymalloc_debug"
}

alias pylint-quick='pylint --reports=n --include-ids=y'
compdef _pylint-quick pylint-quick='pylint --reports=n --include-ids=y'
alias serve_me='python -m http.server'
