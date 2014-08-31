# vim: ft=zsh

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Grep the history with 'h'
function h() {
    history 0 | grep $1
}
