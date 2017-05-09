#!/usr/bin/expect -f

set username "$env(OVPN_LOGIN)\r"
set password "$env(OVPN_PASSWORD)\r"

spawn openvpn --config /config/$env(OVPN_CONFIG) --auth-user-pass --script-security 2
expect "Enter Auth Username:"
send $username
expect "Enter Auth Password:"
send $password
interact
