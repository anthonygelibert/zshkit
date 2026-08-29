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

unalias last_MacGPG 2>/dev/null
function last_MacGPG() {
    local suite_info='/Library/Application Support/GPGTools/version.plist'
    local releases_url='https://releases.gpgtools.org/nightlies/'
    local installed_version installed_build installed_build_number
    local releases_page latest_version latest_build latest_build_number
    local version_pattern='^[0-9]+([.][0-9]+)+$'
    local build_pattern='^([0-9]+)[^0-9]*$'
    local release_pattern='GPG[[:space:]]*Suite[[:space:]]+([0-9]+([.][0-9]+)+)[[:space:]]+[(]([^)]+)[)]'
    local -a match

    if [[ ! -r "$suite_info" ]]; then
        print -u2 -- 'GPG Suite ne semble pas installée : fichier de version introuvable.'
        return 2
    fi

    installed_version=$(
        /usr/bin/plutil -extract CFBundleShortVersionString raw -o - "$suite_info" 2>/dev/null
    ) || {
        print -u2 -- 'Impossible de lire la version de GPG Suite installée.'
        return 2
    }
    installed_version=${installed_version%% *}

    if [[ ! $installed_version =~ $version_pattern ]]; then
        print -u2 -- "Version installée non reconnue : $installed_version"
        return 2
    fi

    installed_build=$(
        /usr/bin/plutil -extract CFBundleVersion raw -o - "$suite_info" 2>/dev/null
    ) || {
        print -u2 -- 'Impossible de lire le build de GPG Suite installé.'
        return 2
    }

    if [[ ! $installed_build =~ $build_pattern ]]; then
        print -u2 -- "Build installé non reconnu : $installed_build"
        return 2
    fi
    installed_build_number=$match[1]

    releases_page=$(
        command curl --silent --show-error --fail --location --max-time 15 "$releases_url"
    ) || {
        print -u2 -- 'Impossible de consulter la page des versions de GPG Suite.'
        return 2
    }

    if [[ ! $releases_page =~ $release_pattern ]]; then
        print -u2 -- 'Impossible d’identifier la dernière version publiée de GPG Suite.'
        return 2
    fi

    latest_version=$match[1]
    latest_build=$match[3]

    if [[ ! $latest_build =~ $build_pattern ]]; then
        print -u2 -- "Build publié non reconnu : $latest_build"
        return 2
    fi
    latest_build_number=$match[1]

    print -- "GPG Suite installée          : $installed_version ($installed_build)"
    print -- "Dernière version publiée     : $latest_version ($latest_build)"

    if [[ $installed_version == $latest_version ]]; then
        if [[ $installed_build == $latest_build ]]; then
            print -- 'État                         : à jour.'
            return 0
        fi

        if (( installed_build_number > latest_build_number )); then
            print -- 'État                         : build installé plus récent que le build publié.'
            return 0
        fi

        print -- 'État                         : mise à jour nécessaire.'
        print -- "Téléchargement                : $releases_url"
        return 1
    fi

    autoload -Uz is-at-least
    if is-at-least "$latest_version" "$installed_version"; then
        print -- 'État                         : version installée plus récente que la version publiée.'
        return 0
    fi

    print -- 'État                         : mise à jour nécessaire.'
    print -- "Téléchargement                : $releases_url"
    return 1
}

# Show/hide hidden files in the Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
