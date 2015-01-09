# vim: ft=zsh

# Open manpage with Preview.app
# Uses ps2pdf conversion because it's faster
if [[ $OSTYPE[1,6] == "darwin" ]]; then
    function man2pdf () {
        man -t $* | ps2pdf - - | open -f -a Preview
    }
fi
