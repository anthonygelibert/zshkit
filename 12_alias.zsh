# vim: ft=zsh
alias check_assert='pmset -g assertions'

# Copy the working dir to the clipboard
alias cpwd='pwd | xargs echo -n | pbcopy'

# Diff
[ $(command -v "colordiff") ] && alias diff="colordiff"

alias mac_console="sudo /Applications/Utilities/Console.app/Contents/MacOS/Console"

# Exit
alias :q=" exit"

# Get the current week
alias week='date "+%V"'

alias -g H='| head'
alias -g M='| most'
alias -g G='| grep'
alias -g L='| less'
alias -g T='| tail'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'

alias dud='du -d 1 -h'
alias duf='du -sh *'


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
            cd "$i"
            [ -d .git ] && git up && exit 0
            [ -d .hg  ] && hg pull && hg up && exit 0
            [ -d .svn ] && svn update && exit 0
            echo "\x1b[31mNo VCS used...\x1b[0m"
        )
    done
}

function upProjs() {
    for i in "$@"; do
        (
            cd $i
            upProj
        )
    done
}
