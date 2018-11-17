# vim: ft=zsh

[[ $(command -v pmset) ]] && alias check_assert='pmset -g assertions'

# Copy the working dir to the clipboard
[[ $(command -v pbcopy) ]] && alias cpwd='pwd | xargs echo -n | pbcopy'

# Diff
[[ $(command -v colordiff) ]] && alias diff="colordiff"

[[ $(command -v sshfs) ]] && alias sshfs="sshfs -oauto_cache,reconnect,defer_permissions,noappledouble,nolocalcaches,no_readahead"

alias mac_console="sudo /Applications/Utilities/Console.app/Contents/MacOS/Console"

# Exit
alias :q=" exit"

# Get the current week
alias week='date "+%V"'

alias -g C='| cut'
alias -g G='| grep'
alias -g GN='| grep -v'
alias -g H='| head'
alias -g L='| less'
alias -g M='| most'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'
alias -g T='| tail'
alias -g X='| xargs'

alias dud='du -d 1 -h'
alias duf='du -sh *'

# Memory and CPU hogs using top and ps
alias mem_hogs_top='top -l 1 -o rsize | head -30'
alias mem_hogs_ps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -20'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -20'

alias grep='grep -E --colour=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'

alias disassemble='llvm-objdump -disassemble -r -x86-asm-syntax=intel'

#alias disableMAO='mv /Users/tony/Library/Mail/Bundles/MailActOn.mailbundle ~/Downloads'
#alias enableMAO='mv ~/Downloads/MailActOn.mailbundle /Users/tony/Library/Mail/Bundles/'

function aZ() {
    sudo addZero.sh "$1"
}

# List the locked file in trash
if [[ $(command -v lsof) ]]; then
    function locked_in_trash() {
        sudo lsof -nPT +c 0 | grep "/.Trash" | grep -v mds | awk '{print $1, " -> ", $9}'
    }

    function locked_in() {
        sudo lsof -nPT +c 0 | grep -E --colour=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} $1 | grep -E --colour=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} -v mds | awk '{print $1, " -> ", $9}'
    }
fi

function cleanProj() {
    for i in */; do
        (
            cd "$i"
            [ -d .git ] && git agc && exit 0
        )
    done
}

function cleanProjs() {
    for i in "$@"; do
        (
            cd "$i"
            cleanProj
        )
    done
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
            cd "$i"
            upProj
        )
    done
}


alias last_MacGPG='grep "GPG Suite" <(curl -silent https://releases.gpgtools.org/nightlies/) | sed -e "s/^.*\(GPG Suite 20[1-2][0-9].[0-9]* ([0-9]*[a-z]*)\).*/\1/g"'

