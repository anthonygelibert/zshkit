# vim: ft=zsh

export PYTHONPATH="$AQITMAP:$AQITMAP/2-train_and_infer:$AQITMAP/3-analyze"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export WORKON_HOME="${P}/pyvenvs/"
export IPYTHONDIR="${XDG_CONFIG_HOME}/python/ipython"

export VIRTUALENVWRAPPER_PYTHON='/opt/local/bin/python3.8'
export VIRTUALENVWRAPPER_VIRTUALENV='/opt/local/bin/virtualenv-3.8'
export VIRTUALENVWRAPPER_VIRTUALENV_CLONE='/opt/local/bin/virtualenv-clone-3.8'
export VIRTUALENVWRAPPER_SCRIPT='/opt/local/bin/virtualenvwrapper.sh-3.8'
source /opt/local/bin/virtualenvwrapper_lazy.sh-3.8

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
