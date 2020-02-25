# vim: ft=zsh

function done_today() {
    of2 -ti 'completion.is("today")' -fx 'name=="Tâches récurrentes"' -p -f perso
}

function done_this_week() {
    of2 -ti 'completion.between("mon","today")' -fx 'name=="Tâches récurrentes"' -p -f perso2
}
