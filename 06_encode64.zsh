# vim: ft=zsh

function e64() {
    echo -n $1 | base64
}

function d64() {
    echo -n $1 | base64 --decode
}
