# vim: ft=zsh

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi

# Grep the history with 'h'
function h() {
    history 0 | grep $1
}
