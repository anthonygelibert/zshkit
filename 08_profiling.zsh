# vim: ft=zsh
# Memory hogs using top and ps
alias mem_hogs_top='top -l 1 -o rsize | head -30'
alias mem_hogs_ps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -20'

# CPU hogs using ps
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -20'
