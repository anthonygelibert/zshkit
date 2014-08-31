# vim: ft=zsh
alias check_assert='pmset -g assertions'

# Copy the working dir to the clipboard
alias cpwd='pwd | xargs echo -n | pbcopy'

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

# Memory and CPU hogs using top and ps
alias mem_hogs_top='top -l 1 -o rsize | head -30'
alias mem_hogs_ps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -20'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -20'

# List the locked file in trash
function locked_in_trash() {
    sudo lsof -nPT +c 0 | grep "/.Trash" | awk '{print $1, " -> ", $9}' | grep -v mds
}

function upProj() {
    for i in */; do
        (
            cd $i
            [ -d .git ] && git up && exit 0
            [ -d .hg  ] && hg pull && hg up && exit 0
            [ -d .svn ] && svn update && exit 0
            echo "No VCS used..."
        )
    done
}
