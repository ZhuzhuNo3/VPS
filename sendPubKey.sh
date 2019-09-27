#!/usr/bin/expect
set timeout -1
set pubkey [string map { "\n" "" } [read [open "~/.ssh/id_rsa.pub" r]]]
set service [lindex $argv 0]
set password [lindex $argv 1]
if { [string match {*@*} $service] } {} else { set service "root@$service" }
spawn ssh $service
set tag "1"
expect {
"*yes/no*" { send "yes\r" ;exp_continue }
"*password:" { send "$password\r" ;exp_continue }
"*login*" { send "if test ! -e .ssh;then mkdir .ssh;chmod 700 .ssh;fi;if test ! -e \".ssh/authorized_keys\";then touch \".ssh/authorized_keys\";chmod 600 \".ssh/authorized_keys\";fi;echo $pubkey >> \".ssh/authorized_keys\";\r"}
}
send "logout\r"
interact
