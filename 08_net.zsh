# vim: ft=zsh

# Open sockets using lsof
alias lssock='sudo lsof -i -P -n'
alias lsock='lsof -i -P -n'

# Get the list of Network Conns
alias netconns='netstat -an -f inet'

# Firewall
alias firewall_off="sudo ipfw flush"
alias firewall_on="sudo ipfw /etc/firewall.conf"
alias firewall_list="sudo ipfw -atN list"

# IP configurations
alias ip0_info='ipconfig getpacket en0'
alias ip1_info='ipconfig getpacket en1'

# Access Point information
alias ap_info='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I'

# DNS Cache
alias cleardns="sudo discoveryutil udnsflushcaches"

# Get only the header of a webserver
function get-header() {
    wget --server-response --spider $1
}
