# vim: ft=zsh

# Set the terminal title in OS X, stolen from http://tinyurl.com/5u9wfr
case $TERM in (*xterm*|ansi|rxvt*)
    function settab { print -Pn "\e]1;%~\a" }
    function settitle { print -Pn "\e]2;%~\a" }
    function chpwd { settab; settitle }
    settab; settitle;
esac
