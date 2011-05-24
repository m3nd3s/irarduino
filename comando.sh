#/bin/bash

export PATH=/usr/bin:/usr/local/bin:/bin

if [ "${1}" = 'back' ]
then
exec osascript << EOF
  tell application "System Events"
    key code 126
  end tell
EOF
fi

if [ "${1}" = 'next' ]
then
exec osascript << EOF
  tell application "System Events"
    key code 125
  end tell
EOF
fi

exit 0
