# vim: ft=zsh
alias check_assert='pmset -g assertions'

# List the locked file in trash
function locked_in_trash()
{
    sudo lsof -nPT +c 0 | grep ".Trash" | awk '{print $1, " -> ", $9}'
}

# Eject a volume
alias eject='hdiutil eject'

# Copy the working dir to the clipboard
alias cpwd='pwd | xargs echo -n | pbcopy'

# More
alias more="more -r"

# Diff
alias diff="colordiff"

# Exit
alias :q="exit"

# Get the current week
alias week='date "+%V"'

# M = more
alias -g M='| more'

alias -g S='| sort'

alias -g US='| sort -u'

# G = grep
alias -g G='| grep'

# C = count lines
alias -g C='| wc -l'

# CA = cat all
alias -g CA="2>&1 | gcat -A"

