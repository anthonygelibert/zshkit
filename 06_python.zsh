export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export WORKON_HOME="${P}/pyvenvs/"
export IPYTHONDIR="${XDG_CONFIG_HOME}/python/ipython"

export VIRTUALENVWRAPPER_PYTHON="/opt/local/bin/python3.12"
export VIRTUALENVWRAPPER_VIRTUALENV="/opt/local/bin/virtualenv-3.12"
export VIRTUALENVWRAPPER_VIRTUALENV_CLONE="/opt/local/bin/virtualenv-clone-3.12"
source /opt/local/bin/virtualenvwrapper_lazy.sh-3.12

alias serve_me='python -m http.server'
