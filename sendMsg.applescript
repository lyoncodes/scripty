on run {phoneNumber, textMessage}
  tell application "Messages"
    set targetService to 1st service whose service type = iMessage
    set contact to buddy phoneNumber of targetService
    send textMessage to contact
  end tell
end run