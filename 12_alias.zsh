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
[ $(command -v "colordiff") ] && alias diff="colordiff"

# Exit
alias :q="exit"

# Get the current week
alias week='date "+%V"'

# M = more
alias -g M='| more'

# G = grep
alias -g G='| grep'

# Memory hogs using top and ps
alias mem_hogs_top='top -l 1 -o rsize | head -30'
alias mem_hogs_ps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -20'

# CPU hogs using ps
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -20'

alias upProj='for i in */; do\
                ((cd $i && git up 2> /dev/null) || (cd $i && hg pull 2> /dev/null && hg up || echo -ne "\x1b[31mWe don'\''t seem to be in a mercurial repository.\n\x1b[0m"));\
              done'

