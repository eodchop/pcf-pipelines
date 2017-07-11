#!/usr/bin/expect


set timeout 50

spawn ssh ubuntu@$env(OPSMANIP)

expect "*assword:"
send "$env(OPSPW)\r";
expect "*$\*"
send "sudo su -\r";
expect "*ubuntu:"
send "$env(OPSPW)\r";
expect "*~#"
send "sed -i 's/1800/6000/g' /home/tempest-web/tempest/web/config/thin.production.yml\r";
expect "*~#"
send "shutdown -r now\r"
