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
export PROJECTS_DIR="${HOME}/Documents/Projects"
# SandBox
export SANDBOX_DIR="${HOME}/Documents/SandBox"
# Mounted volumes
export VOLUMES_DIR="/Volumes"
# Java 1.8 Home on Mac OS X
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home"
# My help folder
export HELPDIR="${HOME}/.zsh/help"
# Git Scripts
export GIT_SCRIPTS="${PROJECTS_DIR}/git-scripts:${PROJECTS_DIR}/git-pull-request"
# Libexec
export LIBEXEC="/usr/libexec"
# VMware tools
export VMWARE_TOOLS="/Applications/VMware Fusion.app/Contents/Library"
# MacPorts Coreutils
export MP_COREUTILS="${MACPORTS_DIR}/libexec/gnubin"
# Grails
export GRAILS_DIR="${MY_APPLICATIONS_DIR}/grails-2.4.0"
# Neo4J
export NEO4J_DIR="${MY_APPLICATIONS_DIR}/neo4j-community-2.1.2"

# Some usefull paths (cd ~D)
# My Documents
export D="${HOME}/Documents/"
# My Downloads
export DL="${HOME}/Downloads/"
# My Projects
export P="${PROJECTS_DIR}/"
# My Pro Projects
export C="${D}/Code"
# This project
export Z="${PROJECTS_DIR}/my_zshkit"

typeset -U path cdpath fpath manpath

# PATH
export PATH="${MP_COREUTILS}:${VMWARE_TOOLS}:${LIBEXEC}:${GIT_SCRIPTS}:${GRAILS_DIR}/bin:${NEO4J_DIR}/bin:${LATEX_BIN_DIR}:${ALT_X11_DIR}/bin:${MACPORTS_DIR}/bin:${MACPORTS_DIR}/sbin:${MANUALLY_INSTALLED_DIR}/bin:${MY_APPLICATIONS_DIR}:/bin:/sbin:/usr/bin:/usr/sbin:/usr/libexec:."
export MANPATH="${MP_COREUTILS}/man:${JAVA_HOME}/man:${ALT_X11_DIR}/share/man:${MACPORTS_DIR}/share/man:${MANUALLY_INSTALLED_DIR}/man:${MANUALLY_INSTALLED_DIR}/share/man:/usr/share/man:/opt/local/etc/zsh/man/"
export FPATH="${HOME}/.zsh/func:${FPATH}:/opt/local/etc/zsh/zshrc.d/local-functions"
export CDPATH=".:${HOME}:${P}:${C}:${D}:${VOLUMES_DIR}"
