#!/usr/bin/expect
set timeout -1
set port [lindex $argv 0]
set password [lindex $argv 1]
spawn bash
send "bash ServerSpeederCentOS6.sh\r"
expect {
"*Enter*" { send "\r" ; sleep 1 ; exp_continue }
"*\[n\]*" { send "\r" ; sleep 1 ; exp_continue }
"*\[y\]*" { send "\r" ; sleep 1 ; exp_continue }
"*root@*" { send "bash ssr.sh\r" }
}
expect {
"*\[1\-15\]*" { send "1\r" ; sleep 1 ; exp_continue }
"*2333)*" { send "$port\r" ; sleep 1 ; exp_continue }
"*doub.io)*" { send "$password\r" ; sleep 1 ; exp_continue }
"*ctr)*" { send "10\r" ; sleep 1 ; exp_continue }
"*v4)*" { send "\r" ; sleep 1 ; exp_continue }
"*Y/n*" { send "Y\r" }
}
expect {
"*y/N*" { send "y\r" }
"*):*" { send "\r" ; sleep 1 ; exp_continue }
}
expect {
"*root@*" { send "rm \-rf `ls \|grep \".*.sh\" \|grep \-v \"^ssr.sh\"`" }
}
interact
