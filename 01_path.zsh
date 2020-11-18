# vim: ft=zsh

# MacPorts  : http://www.macports.org
export MACPORTS_DIR="/opt/local"
# Manually
export MANUALLY_INSTALLED_DIR="/usr/local"
# My Applications
export MY_APPLICATIONS_DIR="${HOME}/Applications"
# My Projects
export PROJECTS_DIR="${HOME}/Documents/Personnel"
# Their Projects
export THEIR_PROJECTS_DIR="${HOME}/Documents/Others"
# SandBox
export SANDBOX_DIR="${HOME}/Documents/BacASable"
# Mounted volumes
export VOLUMES_DIR="/Volumes"
# Java 14 Home on Mac OS X
export JAVA_VERSION="15"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-${JAVA_VERSION}.jdk/Contents/Home"
# Git Scripts
export GIT_SCRIPTS="${MY_APPLICATIONS_DIR}/git-scripts:${MY_APPLICATIONS_DIR}/git-pull-request"
# MacPorts Coreutils
export MP_COREUTILS="${MACPORTS_DIR}/libexec/gnubin"
# XDG
export XDG_CONFIG_HOME="${HOME}/.config"

# Some usefull paths (cd ~D)
# My Documents
export D="${HOME}/Documents"
# Current works
export EC="${D}/EnCours"
# My Downloads
export DL="${HOME}/Downloads"
# My Projects
export P="${PROJECTS_DIR}"
# Their projects
export O="${THEIR_PROJECTS_DIR}"
# This project
export Z="${PROJECTS_DIR}/my_zshkit"
# Corporate
export C="${D}/CarbonBee"

typeset -U path cdpath fpath manpath

export PATH="${HOME}/Library/Caches/com.github.rikvdkleij.intellij-haskell/lts-15/bin:${HOME}/Library/Python/3.8/bin:${HOME}/.local/bin:${HOME}/.iterm2:${MP_COREUTILS}:${GIT_SCRIPTS}:${JAVA_HOME}/bin:${MACPORTS_DIR}/bin:${MACPORTS_DIR}/sbin:${MY_APPLICATIONS_DIR}:${MANUALLY_INSTALLED_DIR}/bin:/usr/libexec:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:."
export MANPATH="${MP_COREUTILS}/man:${JAVA_HOME}/man:${MACPORTS_DIR}/share/man:${MANUALLY_INSTALLED_DIR}/man:${MANUALLY_INSTALLED_DIR}/share/man:${MACPORTS_DIR}/etc/zsh/man/:/usr/share/man"
export FPATH="${FPATH}:${MACPORTS_DIR}/share/zsh/site-functions/:${MACPORTS_DIR}/etc/zsh/zshrc.d/local-functions/general:${Z}/functions"
export CDPATH=".:${HOME}:${P}:${D}:${C}"
