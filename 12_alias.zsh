alias cat="bat "

alias cpwd="pwd | xargs echo -n | pbcopy"

alias grep="grep -E --colour=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} "

alias :q=" exit"
alias week='date "+%V"'

alias -g C="| cut "
alias -g G="| grep "
alias -g GN="| grep -v "
alias -g H="| head "
alias -g L="| less "
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g T="| tail "
alias -g X="| xargs "

alias mem_hogs_top="top -l 1 -o rsize | head -30"
alias mem_hogs_ps="ps wwaxm -o pid,stat,vsize,rss,time,command | head -20"
alias cpu_hogs="ps wwaxr -o pid,stat,%cpu,time,command | head -20"

alias create_ramdisk='diskutil erasevolume APFS "RAMDisk" `hdiutil attach -nomount ram://8388608`'

# To respect XDG
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"

function locked_in_trash() {
    sudo lsof -nPT +c 0 | grep "/.Trash" | grep -v mds | awk '{print $1, " -> ", $9}'
}

function locked_in() {
    sudo lsof -nPT +c 0 | grep -E --colour=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} $1 | grep -E --colour=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} -v mds | awk '{print $1, " -> ", $9}'
}

cleanProj() {
    local project

    for project in *(/N); do
        [[ -e "$project/.git" ]] || continue

        print -r -- "$project"
        command git -C "$project" gc
    done
}

cleanProjs() {
    local root

    for root in "$@"; do
        if [[ ! -d "$root" ]]; then
            print -u2 -- "Répertoire introuvable : $root"
            continue
        fi

        (
            cd -- "$root" || exit 1
            cleanProj
        )
    done
}

upProj() {
    local project

    for project in *(/N); do
        print -r -- "$project"

        if [[ -e "$project/.git" ]]; then
            command git -C "$project" up
        elif [[ -d "$project/.hg" ]]; then
            (
                cd -- "$project" || exit 1
                command hg pull && command hg up
            )
        elif [[ -d "$project/.svn" ]]; then
            (
                cd -- "$project" || exit 1
                command svn update
            )
        else
            print -P -- '%F{red}No VCS used...%f'
        fi
    done
}

upProjs() {
    local root

    for root in "$@"; do
        if [[ ! -d "$root" ]]; then
            print -u2 -- "Répertoire introuvable : $root"
            continue
        fi

        (
            cd -- "$root" || exit 1
            upProj
        )
    done
}

alias last_MacGPG='grep "GPG Suite" <(curl -silent https://releases.gpgtools.org/nightlies/) | sed -e "s/^.*\(GPG Suite 20[1-2][0-9].[0-9]* ([0-9]*[a-z]*)\).*/\1/g" | tail -1'

# Show/hide hidden files in the Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
