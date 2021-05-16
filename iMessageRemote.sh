#!/bin/bash
# sendMsginput -- accepts a Name ($1) and Msg ($2) to send via iMessage application
# checks for valid input
# changes case of Msg ($2) param and stores value in $msg
# searches phone tree database table CONTACTS for NAME ($1) = "$1"
# when found, assigns output to osascript parameter for sendMsg script

send_message()
{ 
  # validate inpute
  if [[ -z $1 || -z $2 ]] ; then
    echo "You must enter a contact name (from phone tree) and a message"
    return 1
  fi
  # convert case of first char
  msg="${2^}"
  # fetch contact from db
  contact=$(sqlite3 pt21.db "SELECT NUMBER from CONTACTS WHERE '$1' == NAME";)
  # call osascript
  osascript ~/scripty/sendMsg.applescript "$contact" "$msg"
  # echo output
  echo you just sent "$contact": "$msg"
}
send_message "$1" "$2"