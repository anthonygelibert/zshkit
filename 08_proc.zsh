# vim: ft=zsh
# Some alias to ps
alias psa='ps -alxww'
alias psj='ps -axjww'
alias pso='ps -axwwo uid,pid,ppid,pgid,pri,nice,state,time,%cpu,%mem,command'

alias stop='kill -TSTP'
alias int='kill -s INT'
alias quit='kill -s QUIT'
