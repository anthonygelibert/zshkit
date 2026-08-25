export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export SAVEHIST=1000000
export HISTSIZE=1000000

alias history="fc -El 1"

# Grep the history with 'h'
function h() {
    history 0 | grep $1
}
