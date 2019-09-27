#!/usr/bin/expect
set timeout -1
set port [lindex $argv 0]
set password [lindex $argv 1]
spawn bash
send "bash ServerSpeederCentOS6.sh\r"
expect {
"*Enter*" { send "\r" ; exp_continue }
"*\[n\]*" { send "\r" ; exp_continue }
"*\[y\]*" { send "\r" ; exp_continue }
"*running*" { send "bash ssr.sh" }
}
expect {
"*\[1-15\]*" { send "1\r" ; exp_continue }
"*2333)*" { send "$port\r" ; exp_continue }
"*doub.io)*" { send "$password\r" ; exp_continue }
"*ctr)*" { send "10\r" ; exp_continue }
"*v4)*" { send "\r" ; exp_continue }
"*Y/n*" { send "Y\r" }
}
expect {
"*):*" { send "\r" ; exp_continue }
"*y/N)*" { send "y\r" }
}
interact
