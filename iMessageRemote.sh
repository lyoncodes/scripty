#!/bin/bash
# sendMsginput -- accepts a phone number and message to send via iMessage application
# receives 2 positional parameters
# takes string passed as $1 and searches phone tree database table CONTACTS for NAME = "$1"
# when found, assigns output to osascript parameter for sendMsg script
# sets 2nd positional parameter to the text passed as param

send_message()
{ 
  contact=$(sqlite3 pt21.db "SELECT NUMBER from CONTACTS WHERE '$1' == NAME";)
  osascript ~/scripty/sendMsg.applescript "$contact" "$2"
  echo you just sent $contact: $2
}
send_message "$1" "$2"