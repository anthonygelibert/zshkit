# vim: ft=zsh

# X11       : http://xquartz.macosforge.org/trac/wiki
export ALT_X11_DIR="/opt/X11"
# XCode     : http://developer.apple.com/technologies/tools/xcode.html
export APPLE_DEVELOPER_DIR="/Developer/usr"
# LaTeX
export LATEX_BIN_DIR="/usr/texbin"
# MacPorts  : http://www.macports.org
export MACPORTS_DIR="/opt/local"
# Manually
export MANUALLY_INSTALLED_DIR="/usr/local"
# My Applications
export MY_APPLICATIONS_DIR="$HOME/Applications"
# My Projects
export PROJECTS_DIR="$HOME/Documents/Projects"
# SandBox
export SANDBOX_DIR="$HOME/Documents/SandBox"
# Official X11
export X11_DIR="/usr/X11"
# Mounted volumes
export VOLUMES_DIR="/Volumes"
# Java 1.7 Home on Mac OS X
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home"
# Swap folder on Mac OS X
export SWAP_DIR="/var/vm/"
# Command-line tools from Developer Tools
export DEVELOPER_TOOLS_COMMAND_LINE="/Developer/Tools"
# My help folder
export HELPDIR="$HOME/.zsh/help"
# Git Scripts
export GIT_SCRIPTS="$PROJECTS_DIR/git-scripts:$PROJECTS_DIR/git-pull-request"
# Libexec
export LIBEXEC="/usr/libexec"
# VMware tools
export VMWARE_TOOLS="/Applications/VMware Fusion.app/Contents/Library"

# Some usefull paths (cd ~D)
# My Documents
export D="$HOME/Documents/"
# My Downloads
export DL="$HOME/Downloads/"
# My Projects
export P="$PROJECTS_DIR/"
# My Pro Projects
export C="$VOLUMES_DIR/Pro/Code"
# Alias for SandBox
export SB="$SANDBOX_DIR/"
# This project
export Z="$PROJECTS_DIR/my_zshkit"

typeset -U path cdpath fpath manpath

# PATH
export PATH="$VMWARE_TOOLS:$LIBEXEC:$GIT_SCRIPTS:$LATEX_BIN_DIR:$ALT_X11_DIR/bin:$MANUALLY_INSTALLED_DIR/bin:$MANUALLY_INSTALLED_DIR/sbin:$MACPORTS_DIR/bin:$MACPORTS_DIR/sbin:$APPLE_DEVELOPER_DIR/bin:$APPLE_DEVELOPER_DIR/sbin:$MY_APPLICATIONS_DIR:$DEVELOPER_TOOLS_COMMAND_LINE:/bin:/sbin:/usr/bin:/usr/sbin:/usr/libexec:$X11_DIR/bin:."
export MANPATH="$ALT_X11_DIR/share/man:$MANUALLY_INSTALLED_DIR/man:$MANUALLY_INSTALLED_DIR/share/man:$MACPORTS_DIR/share/man:$X11_DIR/share/man:$APPLE_DEVELOPER_DIR/share/man:$MSP430GCC_DIR/share/man:/usr/share/man:/opt/local/etc/zsh/man/"
export FPATH="$HOME/.zsh/func:$FPATH:/opt/local/etc/zsh/zshrc.d/local-functions"
export CDPATH=".:$HOME:$P:$C:$D:$DL:$MY_APPLICATIONS_DIR:$VOLUMES_DIR"



