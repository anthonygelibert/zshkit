# vim: ft=zsh

# Don't remember "exa" calls
alias ls="eza -bgF --color auto --icons "
alias l="ls "
alias la="ls -a "
alias ll="ls -l --header --git "
alias lt="ll -T "
alias l@="ll -@ "
alias lla="ll -a "
alias lm="lla | more "
alias lsad='eza --color auto -d .*(/) '
alias lsa='eza --color auto -a .*(.) '
alias lss='ll *(s,S,t) '
alias lsl='ll *(@[1,10]) '
alias lsx='ll *(*[1,10]) '
alias lsw='ll -d *(R,W,X.^ND/) '
alias lsd='eza -d *(/) '
alias lse='eza -d *(/^F) '
alias lsbig="ll -fh *(.OL[1,10]) "
alias lssmall="ll -Sr *(.oL[1,10]) "
alias lsnew="ll -r *(D.om[1,10]) "
alias lsold="ll -rth *(D.om[1,10]) "

# plap: list all occurrences of program in the current PATH
function plap() {
    [ -z "$1" ] && { echo "Usage: plap <program>" ; return 1 } || ls -l ${^path}/*$1*(*N)
}
