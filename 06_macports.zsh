# vim: ft=zsh

# Some MacPorts alias
if [[ $(command -v port) ]]; then
    alias pi="sudo port -v install"
    alias pu="sudo port -v uninstall"
    function ph() {
        port search --name --line "$1" | gawk -F $'\t' '{printf("%-44s %-12s %-s\n", $1,  $2,  $4)}'
    }
    alias po=" port info"
    alias pc=" port contents"
    alias pva=" port variants"
    alias pclean=" sudo port -pf clean --all installed"
    alias paclean=" sudo port -pf clean --all all"

    # Update the list, display the outdated, make the update and uninstall the inactives
    alias supMP="(sudo port -v selfupdate || sudo port -v sync) && port outdated && sudo port -p upgrade outdated && sudo port -u -p uninstall"
    alias upMP="sudo port -v sync && port outdated && sudo port -p upgrade outdated && sudo port -u -p uninstall"
fi
