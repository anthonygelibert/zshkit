# vim: ft=zsh

# Open manpage with Preview.app
# Uses ps2pdf conversion because it's faster
function man2pdf() {
    man -t $* | ps2pdf - - | open -f -a Preview
}
