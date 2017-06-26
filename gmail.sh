#!/bin/bash
username="akhilvantipalli"
password="B@)T@\$T3m@N+^"
echo
curl -u $username:$password --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d'
