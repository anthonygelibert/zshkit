# vim: ft=zsh
DIRSTACKSIZE=8

alias fd=pushd
alias sd=popd

# d: jump between directories
# Copyright 2005 Nikolai Weibull <nikolai@bitwi.se>
# notice: option AUTO_PUSHD has to be set
function d()
{
    emulate -L zsh
    autoload -U colors
    local color=$fg_bold[blue]
    integer i=0
    dirs -p | while read dir; do
        local num="${$(printf "%-4d " $i)/ /.}"
        printf " %s  $color%s$reset_color\n" $num $dir
        (( i++ ))
    done
    integer dir=-1
    read -r 'dir?Jump to directory: ' || return
    (( dir == -1 )) && return
    if (( dir < 0 || dir >= i )); then
        echo d: no such directory stack entry: $dir
        return 1
    fi
    cd ~$dir
}
