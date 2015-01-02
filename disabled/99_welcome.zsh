# vim: ft=zsh

# Parse the "uname" command to obtain :
#   - the kernel features (e.g "root:xnu-1486.2.11~1/RELEASE_X86_64 x86_64")
local KERNEL_FEATURES="`uname -a | grep -o "root:.*"`"

# Parste the "uptime" command to obtain :
#    - the uptime
#   - the number of users
#   - the load
local COMPLETE_UPTIME="`uptime`"
local UPTIME="`echo $COMPLETE_UPTIME | sed 's/.*up//' | sed 's/, [0-9]* users.*//'`"
local USERS="`echo $COMPLETE_UPTIME | grep -o "[0-9]* users" | sed 's/ users$//'`"
local LOAD="`echo $COMPLETE_UPTIME | awk ' BEGIN {FS = ": "}{print $2}'`"
clear
echo "\e[1;30m--------------------------------------------------------------------------------"
echo "\e[0;37m`uname -s` Kernel Version `uname -r` ($KERNEL_FEATURES)\e[0m"
echo "\e[4;31mUPTIME:\e[0m\e[0;37m${UPTIME}\e[0m"
echo "\e[4;31mUSERS:\e[0m \e[0;37m${USERS}\e[0m"
echo "\e[4;31mLOAD:\e[0m \e[0;37m${LOAD}\e[0m"
echo "\e[1;30m--------------------------------------------------------------------------------\e[0m"
