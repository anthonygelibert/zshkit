# vim: ft=zsh

function exportkey()
{
    if [ $# -eq 2 ]; then
        cat $1 | ssh $2 "cat >> ~/.ssh/authorized_keys"
    fi
}
