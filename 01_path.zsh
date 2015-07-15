# vim: ft=zsh

# X11       : http://xquartz.macosforge.org/trac/wiki
export ALT_X11_DIR="/opt/X11"
# LaTeX
export LATEX_BIN_DIR="/usr/texbin"
# MacPorts  : http://www.macports.org
export MACPORTS_DIR="/opt/local"
# Manually
export MANUALLY_INSTALLED_DIR="/usr/local"
# My Applications
export MY_APPLICATIONS_DIR="${HOME}/Applications"
# My Projects
export PROJECTS_DIR="${HOME}/Documents/Personnel"
# SandBox
export SANDBOX_DIR="${HOME}/Documents/BacASable"
# Mounted volumes
export VOLUMES_DIR="/Volumes"
# Java 1.8 Home on Mac OS X
export JAVA_VERSION="1.8.0_51"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk${JAVA_VERSION}.jdk/Contents/Home"
# Git Scripts
export GIT_SCRIPTS="${MY_APPLICATIONS_DIR}/git-scripts:${MY_APPLICATIONS_DIR}/git-pull-request"
# VMware tools
export VMWARE_TOOLS="/Applications/VMware Fusion.app/Contents/Library"
# MacPorts Coreutils
export MP_COREUTILS="${MACPORTS_DIR}/libexec/gnubin"
# Grails
export GRAILS_HOME="${MY_APPLICATIONS_DIR}/grails-2.4.4"
# Neo4J
export NEO4J_DIR="${MY_APPLICATIONS_DIR}/neo4j-community-2.1.4"
# XDG
export XDG_CONFIG_HOME="${HOME}/.config"

# Some usefull paths (cd ~D)
# My Documents
export D="${HOME}/Documents/"
# My Downloads
export DL="${HOME}/Downloads/"
# My Projects
export P="${PROJECTS_DIR}/"
# My Pro Projects
export C="${D}/Nocosium"
# My Apps shortcut
export A="${MY_APPLICATIONS_DIR}"
# This project
export Z="${PROJECTS_DIR}/my_zshkit"
# Nocosium
export N="${D}/Nocosium"

typeset -U path cdpath fpath manpath

# PATH
export PATH="${MP_COREUTILS}:${VMWARE_TOOLS}:${GIT_SCRIPTS}:${GRAILS_HOME}/bin:${NEO4J_DIR}/bin:${JAVA_HOME}/bin:${LATEX_BIN_DIR}:${ALT_X11_DIR}/bin:${MACPORTS_DIR}/bin:${MACPORTS_DIR}/sbin:${MY_APPLICATIONS_DIR}:${MANUALLY_INSTALLED_DIR}/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/libexec:."
export MANPATH="${MP_COREUTILS}/man:${JAVA_HOME}/man:${ALT_X11_DIR}/share/man:${MACPORTS_DIR}/share/man:${MANUALLY_INSTALLED_DIR}/man:${MANUALLY_INSTALLED_DIR}/share/man:/usr/share/man:/opt/local/etc/zsh/man/"
export FPATH="${FPATH}:/opt/local/share/zsh/site-functions/:/opt/local/etc/zsh/zshrc.d/local-functions:$Z/functions"
export CDPATH=".:${HOME}:${P}:${C}:${D}:${A}:${VOLUMES_DIR}"
