#!/bin/bash
echo -n "username: "
read username
echo -n "password: "
# stty -echo to disable text
stty -echo
read password
# stty echo to enable text
stty echo
echo
curl -u $username:$password --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d'
