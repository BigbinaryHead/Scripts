#!/bin/sh
# Script to check for new gmail messages and launch (Icedove) Thumderbird
# Written by hip0 based on a one liner script suggeted by 
# http://ihaveapc.com/2012/03/how-to-quickly-check-your-unread-gmail-from-linux-mint-ubuntu-terminal/
# hipo@noah:~$ date
# Sun Apr  1 20:37:41 EEST 2012

gmail_username="akhilvantipalli";
gmail_password="B@)T@\$T3m@N+^";
# gmail atom url
gmail_atom_url='https://mail.google.com/mail/feed/atom';
# set the mail client you prefer  or action if new messages are in gmail mailbox

curl -u ${gmail_username}@gmail.com:${gmail_password} --silent "$gmail_atom_url" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {
print $i
}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 â€“ \1/p"

