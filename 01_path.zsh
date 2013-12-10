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
# Java 1.7 Home on Mac OS X
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home"
# Swap folder on Mac OS X
export SWAP_DIR="/var/vm/"
# My help folder
export HELPDIR="${HOME}/.zsh/help"
# Git Scripts
export GIT_SCRIPTS="${PROJECTS_DIR}/git-scripts:${PROJECTS_DIR}/git-pull-request"
# Libexec
export LIBEXEC="/usr/libexec"
# VMware tools
export VMWARE_TOOLS="/Applications/VMware Fusion.app/Contents/Library"
# Yagarto
export YAGARTO_NONE="/opt/yagarto/yagarto-4.7.2"
export YAGARTO_ELF="/opt/yagarto/yagarto-4.4.2"
# MacPorts Coreutils
export MP_COREUTILS="${MACPORTS_DIR}/libexec/gnubin/"

# Some usefull paths (cd ~D)
# My Documents
export D="${HOME}/Documents/"
# My Downloads
export DL="${HOME}/Downloads/"
# My Projects
export P="${PROJECTS_DIR}/"
# My Pro Projects
export PRO="${VOLUMES_DIR}/Pro"
export C="${PRO}/Code"
# This project
export Z="${PROJECTS_DIR}/my_zshkit"

typeset -U path cdpath fpath manpath

# PATH
export PATH="${MP_COREUTILS}:${YAGARTO_ELF}/bin:${YAGARTO_NONE}/bin:${VMWARE_TOOLS}:${LIBEXEC}:${GIT_SCRIPTS}:${LATEX_BIN_DIR}:${ALT_X11_DIR}/bin:${MACPORTS_DIR}/bin:${MACPORTS_DIR}/sbin:${MANUALLY_INSTALLED_DIR}/bin:${MY_APPLICATIONS_DIR}:${DEVELOPER_TOOLS_COMMAND_LINE}:/bin:/sbin:/usr/bin:/usr/sbin:/usr/libexec:."
export MANPATH="${MP_COREUTILS}/man:${JAVA_HOME}/man:${YAGARTO_ELF}/share/man:${YAGARTO_NONE}/share/man:${ALT_X11_DIR}/share/man:${MACPORTS_DIR}/share/man:${MANUALLY_INSTALLED_DIR}/man:${MANUALLY_INSTALLED_DIR}/share/man:/usr/share/man:/opt/local/etc/zsh/man/"
export FPATH="${HOME}/.zsh/func:${FPATH}:/opt/local/etc/zsh/zshrc.d/local-functions"
export CDPATH=".:${HOME}:${P}:${C}:${D}:${VOLUMES_DIR}"



