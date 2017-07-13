#!/usr/bin/expect
set timeout 50
spawn bash
expect "*#"
send "apt-get update\r";
expect "*#"
send "apt-get install ssh expect -y\r";
spawn ssh -o "StrictHostKeyChecking=no" ubuntu@$env(OPSMANIP)

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
