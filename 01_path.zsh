# MacPorts: http://www.macports.org
export MACPORTS_DIR="/opt/local"
# Manually
export MANUALLY_INSTALLED_DIR="/usr/local"
# My Applications
export MY_APPLICATIONS_DIR="${HOME}/Applications"
# My Projects
export PROJECTS_DIR="${HOME}/Documents/Personnel"
# Mounted volumes
export VOLUMES_DIR="/Volumes"
# GraalJVM 23
export JAVA_VERSION="graalvm-jdk-23.0.1+11.1"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/${JAVA_VERSION}/Contents/Home"
# IDEA home
export IDEA_HOME="/Applications/IntelliJ IDEA.app/Contents/MacOS"

# MacPorts Coreutils
export MP_COREUTILS="${MACPORTS_DIR}/libexec/gnubin"
# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"

# Some usefull paths (cd ~D)
# My Documents
export D="${HOME}/Documents"
# Current works
export EC="${D}/EnCours"
# My Downloads
export DL="${HOME}/Downloads"
# My Projects
export P="${PROJECTS_DIR}"
# This project
export Z="${PROJECTS_DIR}/my_zshkit"
# Corporate
export C="${D}/CarbonBee"

typeset -U path cdpath fpath manpath

export PATH="${IDEA_HOME}:${MY_APPLICATIONS_DIR}:${MP_COREUTILS}:${JAVA_HOME}/bin:${MACPORTS_DIR}/bin:${MACPORTS_DIR}/sbin:${MANUALLY_INSTALLED_DIR}/bin:${MANUALLY_INSTALLED_DIR}/sbin:/usr/libexec:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:."
export MANPATH="${MP_COREUTILS}/man:${JAVA_HOME}/man:${MACPORTS_DIR}/share/man:/usr/share/man"
export FPATH="${FPATH}:/opt/local/share/git/contrib/completion:${Z}/functions"
export CDPATH=".:${HOME}:${P}:${D}:${C}"
