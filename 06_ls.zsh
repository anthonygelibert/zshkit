export EZA_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/eza/${TERRE_BRAISE_MODE}"

alias l='eza -1 --group --header --git --icons --classify --color auto '
alias ls='eza -1 --group --header --git --icons --classify --color auto '
alias ll='eza -lg --time-style long-iso --group --header --git --icons --classify --color auto'
alias lla='eza -lga --time-style long-iso --group --header --git --icons --classify --color auto'
alias la='eza -la --time-style long-iso --group --header --git --icons --classify --color auto'
alias lt='eza -T --level=2 --group --header --git --icons --classify --color auto'
alias l@='eza -@ -lg --time-style long-iso --group --header --git --icons --classify --color auto'
