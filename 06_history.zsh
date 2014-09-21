# vim: ft=zsh

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

# Grep the history with 'h'
function h() {
    history 0 | grep $1
}
