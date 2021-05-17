#!/bin/bash
# checks input precision & sets output precision accordingly, defaulting to std 2 if no input is passed 
if [ "$1" = "-p" ] ; then
  precision=$2
  shift 2
else
  precision=2
fi
# Here doc; bc stream
# pass scale to stream
# pass expression to calculate to stream
# terminate script with quit
# terminate input stream with EOF match
bc -q -l << EOF
  scale=$precision
  $*
  quit
EOF

exit 0