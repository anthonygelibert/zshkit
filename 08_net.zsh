alias lsock='lsof -i -P -n'
alias lssock='sudo lsof -i -P -n'
alias netconns='netstat -an -f inet'

alias ip0_info='ipconfig getpacket en0'
alias ip1_info='ipconfig getpacket en1'
alias ip2_info='ipconfig getpacket en2'
alias ip3_info='ipconfig getpacket en3'
alias ip4_info='ipconfig getpacket en4'
alias ip5_info='ipconfig getpacket en5'

alias cleardns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Get only the header of a webserver
function get-header() {
    wget --server-response --spider "$1"
}
