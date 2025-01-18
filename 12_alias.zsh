alias bat="bat --style=auto --theme=ansi "
alias -g cat="bat "

alias cpwd="pwd | xargs echo -n | pbcopy"

alias diff="colordiff "
alias -g grep="grep -E --colour=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} "

alias :q=" exit"
alias week='date "+%V"'

alias -g C="| cut "
alias -g G="| grep "
alias -g GN="| grep -v "
alias -g H="| head "
alias -g L="| less "
alias -g M="| most "
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g T="| tail "
alias -g X="| xargs "

alias mem_hogs_top="top -l 1 -o rsize | head -30"
alias mem_hogs_ps="ps wwaxm -o pid,stat,vsize,rss,time,command | head -20"
alias cpu_hogs="ps wwaxr -o pid,stat,%cpu,time,command | head -20"

alias create_ramdisk='diskutil erasevolume APFS "RAMDisk" `hdiutil attach -nomount ram://8388608`'

function aZ() {
    noglob sudo ~/Applications/addZero.sh "$1"
}

function locked_in_trash() {
    sudo lsof -nPT +c 0 | grep "/.Trash" | grep -v mds | awk '{print $1, " -> ", $9}'
}

function locked_in() {
    sudo lsof -nPT +c 0 | grep -E --colour=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} $1 | grep -E --colour=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} -v mds | awk '{print $1, " -> ", $9}'
}

function cleanProj() {
    for i in */; do
        (
            cd "$i"
            echo "$i"
            [ -d .git ] && git agc && exit 0
        )
    done
}

function cleanProjs() {
    for i in "$@"; do
        (
            cd "$i"
            echo "$i"
            cleanProj
        )
    done
}

function upProj() {
    for i in */; do
        (
            cd "$i"
            echo "$i"
            [ -d .git ] && git up && exit 0
            [ -d .hg ] && hg pull && hg up && exit 0
            [ -d .svn ] && svn update && exit 0
            echo "\x1b[31mNo VCS used...\x1b[0m"
        )
    done
}

function upProjs() {
    for i in "$@"; do
        (
            cd "$i"
            echo "$i"
            upProj
        )
    done
}

alias last_MacGPG='grep "GPG Suite" <(curl -silent https://releases.gpgtools.org/nightlies/) | sed -e "s/^.*\(GPG Suite 20[1-2][0-9].[0-9]* ([0-9]*[a-z]*)\).*/\1/g" | tail -1'

# Show/hide hidden files in the Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
