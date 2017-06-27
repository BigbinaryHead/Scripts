#!/bin/sh

#function to print color text
#credits jbucaran stackoverflow
#https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
cecho() {
  local code="\033["
  case "$1" in
    black  | bk) color="${code}0;30m";;
    red    |  r) color="${code}1;31m";;
    green  |  g) color="${code}1;32m";;
    yellow |  y) color="${code}1;33m";;
    blue   |  b) color="${code}1;34m";;
    purple |  p) color="${code}1;35m";;
    cyan   |  c) color="${code}1;36m";;
    gray   | gr) color="${code}0;37m";;
    *) local text="$1"
  esac
  [ -z "$text" ] && local text="$color$2${code}0m"
  echo "$text"
}

file=listRemainders.txt

if [ ! -e "$file" ] ; then
    touch "$file"
fi

#display 1 for taking remainder and 2 for viewing remainders 3 to edit
cecho b "1: take remainder"
cecho g "2: view remainders"
cecho r "3: edit remainders"

CHOICE=0
cecho r "Enter Choice"
#reading choice
read CHOICE

#check CHOICE 1/2/3 and do appropriate operation
if [ "$CHOICE" -eq 1 ]; then
#taking remainder code
cecho y "enter date "
read DATE
cecho y "enter remainder"
read REMAINDER
echo "$DATE --> $REMAINDER">> listRemainders.txt   
elif [ "$CHOICE" -eq 2 ]; then
#for listing remainders
   COUNT=$(wc -l < listRemainders.txt)
   cecho g "Number of remainders on list : $COUNT"
   cecho r "Remainders ::"
   cat listRemainders.txt
elif [ "$CHOICE" -eq 3 ]; then
   gedit listRemainders.txt 
   cecho g "file edited successfully"
else
    echo "wrong choice"
fi
