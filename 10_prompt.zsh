# vim: ft=zsh

# secondary prompt, printed when the shell need
# more information to complete a command.
PS2='%_> '

# selection prompt used within a select loop.
PS3='?# '

# the execution trace prompt (setopt xtrace). default: '+%N:%i>'
export PS4='%B[%*]%b [%L] (%N:%i) %_ '

# Right prompt with clock: I disable it, it's now a feature of iTerm
# export RPS1="%{$fg_bold[black]%}%D{%d/%m/%y %H:%M:%S}%{${reset_color}%}"
