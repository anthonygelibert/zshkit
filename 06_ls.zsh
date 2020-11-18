# vim: ft=zsh

# Don't remember "exa" calls
alias ls=" exa -bgF --color auto"
alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias le="/bin/ls -bFGhle"
alias l@="ll -@"
alias lla="ll -a"
alias lm="lla | more"
alias lt="exa -ltr"
alias lsad='exa -d .*(/)'
alias lsa='exa -a .*(.)'
alias lss='exa -l *(s,S,t)'
alias lsl='exa -l *(@[1,10])'
alias lsx='exa -l *(*[1,10])'
alias lsw='exa -ld *(R,W,X.^ND/)'
alias lsd='exa -d *(/)'
alias lse='exa -d *(/^F)'
alias lsbig="exa -flh *(.OL[1,10])"
alias lssmall="exa -Srl *(.oL[1,10])"
alias lsnew="exa -rl *(D.om[1,10])"
alias lsold="exa -rtlh *(D.om[1,10])"

# plap: list all occurrences of program in the current PATH
function plap() {
    [ -z "$1" ] && { echo "Usage: plap <program>" ; return 1 } || ls -l ${^path}/*$1*(*N)
}
