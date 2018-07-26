# vim: ft=zsh

# X11       : http://xquartz.macosforge.org/trac/wiki
export ALT_X11_DIR="/opt/X11"
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
# Java 1.8 Home on Mac OS X
#export JAVA_VERSION="1.8.0_144"
#export JAVA_VERSION="9.0.4"
export JAVA_VERSION="10.0.1"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-${JAVA_VERSION}.jdk/Contents/Home"
# Git Scripts
export GIT_SCRIPTS="${MY_APPLICATIONS_DIR}/git-scripts:${MY_APPLICATIONS_DIR}/git-pull-request:${MY_APPLICATIONS_DIR}/git-extra-commands/bin"
# VMware tools
export VMWARE_TOOLS="/Applications/VMware Fusion.app/Contents/Library"
# MacPorts Coreutils
export MP_COREUTILS="${MACPORTS_DIR}/libexec/gnubin"
# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
# CUDA
export CUDA_VERSION="9.1"
export CUDA_HOME="/Developer/NVIDIA/CUDA-${CUDA_VERSION}"

# Some usefull paths (cd ~D)
# My Documents
export D="${HOME}/Documents/"
# My Downloads
export DL="${HOME}/Downloads/"
# My Projects
export P="${PROJECTS_DIR}/"
# Their projects
export T="${THEIR_PROJECTS_DIR}/"
# My Apps shortcut
export A="${MY_APPLICATIONS_DIR}"
# This project
export Z="${PROJECTS_DIR}/my_zshkit"
# CarbonBee
export C="${D}/CarbonBee"
export REDAC="${C}/Recherche/AQiT/Redaction/"
export CODE="${C}/Recherche/AQiT/Code/"
# LCIS
export L="${D}/LCIS"

typeset -U path cdpath fpath manpath

export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:/usr/local/cuda/extras/CUPTI/lib:${CUDA_HOME}/lib:${DYLD_LIBRARY_PATH}"
export          PATH="${CUDA_HOME}/bin:${MY_APPLICATIONS_DIR}/ofexport2/bin:${MP_COREUTILS}:${VMWARE_TOOLS}:${GIT_SCRIPTS}:${JAVA_HOME}/bin:${ALT_X11_DIR}/bin:${MACPORTS_DIR}/bin:${MACPORTS_DIR}/sbin:${MY_APPLICATIONS_DIR}:${MANUALLY_INSTALLED_DIR}/bin:/usr/libexec:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Library/TeX/texbin"
export INTERNAL_PATH="${CUDA_HOME}/bin:${MY_APPLICATIONS_DIR}/ofexport2/bin:${MP_COREUTILS}:${VMWARE_TOOLS}:${GIT_SCRIPTS}:${JAVA_HOME}/bin:${ALT_X11_DIR}/bin:${MACPORTS_DIR}/bin:${MACPORTS_DIR}/sbin:${MY_APPLICATIONS_DIR}:${MANUALLY_INSTALLED_DIR}/bin:/usr/libexec/"
export MANPATH="${CUDA_HOME}/doc/man:${MP_COREUTILS}/man:${JAVA_HOME}/man:${ALT_X11_DIR}/share/man:${MACPORTS_DIR}/share/man:${MANUALLY_INSTALLED_DIR}/man:${MANUALLY_INSTALLED_DIR}/share/man:${MACPORTS_DIR}/etc/zsh/man/:/usr/share/man"
export FPATH="${FPATH}:${MACPORTS_DIR}/share/zsh/site-functions/:${MACPORTS_DIR}/etc/zsh/zshrc.d/local-functions/darwin:${MACPORTS_DIR}/etc/zsh/zshrc.d/local-functions/general:$Z/functions"
export CDPATH=".:${HOME}:${P}:${D}:${A}:${C}:${C}/Etude:${C}/Recherche:${REDAC}:${CODE}:${L}:${T}:${VOLUMES_DIR}"
