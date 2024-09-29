# vim: ft=zsh

# MacPorts Installer addition on 2020-11-14_at_14:31:08: adding an appropriate DISPLAY variable for use with MacPorts.
export DISPLAY=:0
# Finished adapting your DISPLAY environment variable for use with MacPorts.

# Some MacPorts alias
alias pi="sudo port -v install "
alias pu="sudo port -v uninstall "
function ph() {
    port search --name --line "$1" | gawk -F $'\t' '{printf("%-44s %-12s %-s\n", $1,  $2,  $4)}'
}
alias po="port info "
alias pc="port contents "
alias pva="port variants "
alias pclean="sudo port -pf clean --all installed"
alias paclean="sudo port -pf clean --all all"

# Update the list, display the outdated, make the update and uninstall the inactives
alias supMP="(sudo port -v selfupdate || sudo port -v sync) && port outdated && sudo port -p upgrade outdated && sudo port -u -p uninstall && sudo port uninstall leaves && sudo port uninstall leaves && sudo port uninstall leaves"
alias upMP="sudo port -v sync && port outdated && sudo port -p upgrade outdated && sudo port -u -p uninstall && sudo port uninstall leaves && sudo port uninstall leaves && sudo port uninstall leaves"
