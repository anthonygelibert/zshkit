typeset -g -A key

# ——— Paramètres généraux ———
# Délimiteurs "ingénieur" : les caractères ci-dessous NE font PAS partie d’un mot
# (impacts: backward-word, forward-word, etc.)
export WORDCHARS="*?[]~=&;!#$%^(){}<>"

# history-beginning-search (↑/↓ recherche par préfixe)
autoload -Uz history-beginning-search-backward history-beginning-search-forward

# Press "Ctrl-o" in a menu to select an option and continue in the menu
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

# Historique :
# ↑/↓ : history-beginning-search (par préfixe)
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
# Ctrl-R : recherche incrémentale inverse
bindkey '^R' history-incremental-pattern-search-backward
# Ctrl-S : (souvent bloqué par flow control ; vous avez NO_FLOW_CONTROL) recherche vers l'avant
bindkey '^S' history-incremental-pattern-search-forward

# Terminal.app sucks :'(
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey "^[[1~" beginning-of-line
bindkey '^[[3~' delete-char
bindkey "^[[4~" end-of-line
bindkey "^[[5~" up-line-or-history

bindkey '^?' backward-delete-char
bindkey "^H" backward-delete-char
