# vim: ft=zsh

export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export WORKON_HOME="${P}/pyvenvs/"
export IPYTHONDIR="${XDG_CONFIG_HOME}/python/ipython"

alias pylint-quick='pylint --reports=n --include-ids=y'
compdef _pylint-quick pylint-quick='pylint --reports=n --include-ids=y'
