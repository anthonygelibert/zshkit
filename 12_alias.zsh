# vim: ft=zsh
alias check_assert='pmset -g assertions'

# List the locked file in trash
function locked_in_trash()
{
    sudo lsof -nPT +c 0 | grep "/.Trash" | awk '{print $1, " -> ", $9}' | grep -v mds
}

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

# G = grep
alias -g G='| grep'

