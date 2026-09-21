# Base interactive: compact grid with terminal-only decoration.
alias ls='eza --icons=auto --classify=auto --group-directories-first'

# Common views.
alias l='ls --oneline'
alias ll='ls --long --header --git --smart-group --time-style=long-iso'
alias la='ls --all'
alias lla='ll --all'

# Specialized views.
alias lt='ls --tree --level=2 --git-ignore'
alias l@='ll --extended'
alias lr='ll --sort=newest --reverse'
alias ld='ls --only-dirs'
