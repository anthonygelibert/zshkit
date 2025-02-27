typeset -g -A key

# Press "Ctrl-o" in a menu to select an option and continue
# in the menu
bindkey -M menuselect '\C-o' accept-and-menu-complete

# Press "q" in a list to quit
bindkey -M listscroll q send-break

# Kill the region for later yanking
bindkey '\C-w' kill-region

# .: rationalize dot -> ... = ../..
function rationalize-dot() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalize-dot
bindkey . rationalize-dot

bindkey "^R" history-incremental-search-backward

# Terminal.app sucks :'(
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey "^[[1~" beginning-of-line
bindkey '^[[3~' delete-char
bindkey "^[[4~" end-of-line
bindkey "^[[5~" up-line-or-history

#    bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
bindkey "^H" backward-delete-char
