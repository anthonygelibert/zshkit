# vim: ft=zsh

export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export WORKON_HOME="${P}/pyvenvs/"
export IPYTHONDIR="${XDG_CONFIG_HOME}/python/ipython"

export VIRTUALENVWRAPPER_PYTHON='/opt/local/bin/python3.9'
export VIRTUALENVWRAPPER_VIRTUALENV='/opt/local/bin/virtualenv-3.9'
export VIRTUALENVWRAPPER_VIRTUALENV_CLONE='/opt/local/bin/virtualenv-clone-3.9'
export VIRTUALENVWRAPPER_SCRIPT='/opt/local/bin/virtualenvwrapper.sh-3.9'
source /opt/local/bin/virtualenvwrapper_lazy.sh-3.9

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

alias serve_me='python -m http.server'
