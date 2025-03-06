export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export HIST_STAMPS="dd.mm.yyyy"
export HISTSIZE=1000000
export SAVEHIST=10000

alias history="fc -El 1"

# Grep the history with 'h'
function h() {
    history 0 | grep $1
}
