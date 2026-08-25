#  use 'zstyle' for getting current settings
#  press ^Xh (control-x h) for getting tags in context
#        ^X? (control-x ?) to run complete_debug with trace output

# Files to ignore during completion
autoload -Uz compinit

zmodload zsh/complist
zmodload zsh/stat
zmodload zsh/datetime

_ZCACHEDIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
_ZCOMPDUMP="${_ZCACHEDIR}/zcompdump-${ZSH_VERSION}"

mkdir -p "$_ZCACHEDIR"

typeset -A _zcompdump_stat
typeset -i _zcompdump_mtime=0

if [[ -s "$_ZCOMPDUMP" ]]; then
    zstat -H _zcompdump_stat +mtime -- "$_ZCOMPDUMP"
    _zcompdump_mtime=$_zcompdump_stat[mtime]
fi

# Rescan complet une fois par jour, chargement rapide sinon.
if [[ ! -s "$_ZCOMPDUMP" ]] ||
   (( EPOCHSECONDS - _zcompdump_mtime > 86400 )); then
    compinit -d "$_ZCOMPDUMP"
else
    compinit -C -d "$_ZCOMPDUMP"
fi

if [[ -s "$_ZCOMPDUMP" &&
      ( ! -s "${_ZCOMPDUMP}.zwc" ||
        "$_ZCOMPDUMP" -nt "${_ZCOMPDUMP}.zwc" ) ]]; then
    zcompile "$_ZCOMPDUMP"
fi

unset _zcompdump_stat _zcompdump_mtime

zstyle ':completion:*' use-ip true                                              # By default, the function _hosts that completes host names strips IP addresses from entries read from host databases such as NIS and ssh files. If this style is true, the corresponding IP addresses can be completed as well.
zstyle ':completion:*' list-grouped true                                        # If this style is ‘true’ (the default), the completion system will try to make certain completion listings more compact by grouping matches.
zstyle ':completion:*' list-packed true                                         # This is tested for each tag valid in the current context as well as the default tag. If it is set to ‘true’, the corresponding matches appear in listings as if the LIST_PACKED option were set.
zstyle ':completion:*' verbose true                                             # If set, as it is by default, the completion listing is more verbose. In particular many commands show descriptions for options if this style is ‘true’.
zstyle ':completion:*' completer _complete _prefix _match _approximate _ignored # The strings given as the value of this style provide the names of the completer functions to use.
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator '#'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' rehash yes
zstyle ':completion:*' expand yes
zstyle ':completion:*' squeeze-slashes yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Enable menu completion
zstyle ':completion:*:*:*:*:*' menu select

# activate menu
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu true
zstyle ':completion:*:history-words' remove-all-dups true
zstyle ':completion:*:history-words' stop true

# allow approximate matching
zstyle ':completion:*:corrections' format '%U%B%d (errors: %e)%b%u'
zstyle ':completion:*:match:*' original only

# separate matches into groups
zstyle ':completion:*:matches' group true

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion::approximate*:*' prefix-needed false
zstyle ':completion:*:(^approximate):*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion::complete:*:functions' ignored-patterns '_*'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:prefix:*' add-space true

# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:correct:*' original true

## offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Group relatex matches:
zstyle ':completion:*:-command-:*:(commands|builtins|reserved-words-aliases)' group-name commands

# Separate man page sections
zstyle ':completion:*:manuals' separate-sections true

# Give long completion options in a list. tab to advance.
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:*:*:processes' command "ps -o pid,user,comm -w -w"
zstyle ':completion:*:windows' menu on=0

# Ignore completion functions for commands you don't have:
zstyle ':completion:correct:' prompt 'correct to: %e'

# Describe options in full
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description 'yes'

###########
# BY APPS #
###########

# chown
zstyle ':completion::complete:chown:*' ignored-patterns '_*'

# Git
zstyle ':completion:*:*:git:*' script /opt/local/share/git/contrib/completion/git-completion.zsh

# Only java files for javac
zstyle ':completion:*:javac:*' file-patterns '*.java'

# No binary files for editors and pagers
zstyle ':completion:*:vim:*' ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'
zstyle ':completion:*:less:*' ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'
zstyle ':completion:*:more:*' ignored-patterns '*.(o|a|so|dvi|fig|out|class|pdf|ps|pyc)'

# TAR files only for tar
zstyle ':completion:*:tar:*' file-patterns '*.tar|*.tgz|*.tz|*.tar.Z|*.tar.bz2|*.tZ|*.tar.gz'

#########
# USERS #
#########

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
  clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
  gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
  ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
  operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
  usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Caching
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path "$_ZCACHEDIR/compcache"
