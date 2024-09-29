# vim: ft=zsh

#  use 'zstyle' for getting current settings
#  press ^Xh (control-x h) for getting tags in context
#        ^X? (control-x ?) to run complete_debug with trace output

# Files to ignore during completion
autoload -Uz compinit
compinit;

zmodload zsh/complist

autoload -U zsh-mime-setup
autoload -U zsh-mime-handler
zsh-mime-setup

zstyle ':completion:*' use-perl true # Various parts of the function system use awk to extract words from files or command output as this universally available. However, many versions of awk have arbitrary limits on the size of input. If this style is set, perl will be used instead.
zstyle ':completion:*' use-ip true # By default, the function _hosts that completes host names strips IP addresses from entries read from host databases such as NIS and ssh files. If this style is true, the corresponding IP addresses can be completed as well.
zstyle ':completion:*' list-grouped true # If this style is ‘true’ (the default), the completion system will try to make certain completion listings more compact by grouping matches.
zstyle ':completion:*' list-packed true # This is tested for each tag valid in the current context as well as the default tag. If it is set to ‘true’, the corresponding matches appear in listings as if the LIST_PACKED option were set.
zstyle ':completion:*' verbose true # If set, as it is by default, the completion listing is more verbose. In particular many commands show descriptions for options if this style is ‘true’.
zstyle ':completion:*' completer _complete _prefix _match _approximate _ignored # The strings given as the value of this style provide the names of the completer functions to use.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator '#'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' rehash yes
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'

# case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

# Enable menu completion
zstyle ':completion:*:*:*:*:*' menu select

# activate menu
zstyle ':completion:*:history-words'   list false
zstyle ':completion:*:history-words'   menu true
zstyle ':completion:*:history-words'   remove-all-dups true
zstyle ':completion:*:history-words'   stop true

# allow approximate matching
zstyle ':completion:*:corrections' format '%U%B%d (errors: %e)%b%u'
zstyle ':completion:*:match:*' original only

# separate matches into groups
zstyle ':completion:*:matches' group true

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion::approximate*:*' prefix-needed false
zstyle ':completion:*:(^approximate):*'    matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion::complete:*:functions' ignored-patterns '_*'
zstyle ':completion:*:functions'           ignored-patterns '_*'
zstyle ':completion:*:prefix:*' add-space true

# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:correct:*' original true

## offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Group relatex matches:
zstyle ':completion:*:-command-:*:(commands|builtins|reserved-words-aliases)' group-name commands

# Separate man page sections
zstyle ':completion:*:manuals' seperate-sections true

# Give long completion options in a list. tab to advance.
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:*:*:processes' command "ps -o pid,user,comm -w -w"
zstyle ':completion:*:windows' menu on=0

# Ignore completion functions for commands you don't have:
zstyle ':completion:correct:'   prompt 'correct to: %e'

# Describe options in full
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:options'  auto-description '%d'
zstyle ':completion:*:options'  description 'yes'

###########
# BY APPS #
###########

# chown
zstyle ':completion::complete:chown:*' ignored-patterns '_*'

# Git
zstyle ':completion:*:*:git:*' script /opt/local/share/git/contrib/completion/git-completion.zsh

# Only java files for javac
zstyle ':completion:*:javac:*'    file-patterns '*.java'

# DJVU files for djvu2pdf
zstyle ':completion:*:djvu2pdf:*' file-patterns '*.djvu'

# EXE files for Wine
zstyle ':completion:*:wine:*'     file-patterns '*.exe'

# LUA files for lua and luajit.
zstyle ':completion:*:lua:*'      file-patterns '*.lua'
zstyle ':completion:*:luajit:*'   file-patterns '*.lua'

# No binary files for editors and pagers
zstyle ':completion:*:vim:*'   ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'
zstyle ':completion:*:mvim:*'  ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'
zstyle ':completion:*:atom:*'  ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'
zstyle ':completion:*:less:*'  ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'
zstyle ':completion:*:zless:*' ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'
zstyle ':completion:*:more:*'  ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'
zstyle ':completion:*:most:*'  ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'

# PDF files only for xpdf
zstyle ':completion:*:xpdf:*'  file-patterns '*.pdf'

# TAR files only for tar
zstyle ':completion:*:tar:*'   file-patterns '*.tar|*.tgz|*.tz|*.tar.Z|*.tar.bz2|*.tZ|*.tar.gz'

# DVI files for dvi commands
zstyle ':completion:*:xdvi:*'  file-patterns '*.dvi'
zstyle ':completion:*:dvips:*' file-patterns '*.dvi'

# Clean LaTeX
zstyle ':completion:*:cleanLatex.sh:*'  file-patterns '*.tex'

# Code Insiders is Code
compdef code-insiders='code'

#########
# HOSTS #
#########

# Use /etc/hosts, known_hosts and SSH config for hostname completion
#[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
#[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
#[ -r ~/.ssh/config ] && _ssh_config_hosts=(${(s: :)${(ps:\t:)${(f)"$(<$HOME/.ssh/config|grep 'Host')"}#Host}#Hostname}) || _ssh_config_hosts=()
hosts=(
#  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_ssh_config_hosts[@]"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts

#########
# USERS #
#########

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Caching
zstyle ':completion:*' use-cache true && zstyle ':completion::complete:*' cache-path $HOME/.zcompcache/
