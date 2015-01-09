# vim: ft=zsh

[[ $(command -v lesspipe.sh) ]] && export LESSOPEN="|lesspipe.sh %s"
export LESS="-R -M --shift 5"
export LESSCHARSET="utf-8"
[[ $(command -v most) ]] && export PAGER="most" && export MOST_SWITCHES="-s"
