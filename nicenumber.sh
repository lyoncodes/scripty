#!/bin/bash

# nicenumber--Given a number, shows it in comma-separated form.
# instantiates nicenum or, if a second arg is passed, echoes the output

nicenumber ()
{
  integer=$(echo $1 | cut -d. -f1) #left of the decimal
  decimal=$(echo $1 | cut -d. -f2) #right of the decimal

  # Check if number has more than the integer part
  if [ "$decimal" != "$1" ]; then
    # There is a fractional part
    result="${DD:= '.'}$decimal"
  fi

  thousands=$integer

  # While loop
  # iteratively remove the three least significant digits from the calue stored in the # thousands variable (17)
  while [ $thousands -gt 999 ]; do
    remainder=$(($thousands % 1000)) #Three least significant digits

    #We need 'remainder' to be three digits. So we need to check if the thousandths value needs to be 'filled in' with 0s
    while [ ${#remainder} -lt 3 ] ; do
      remainder="0$remainder"
    done

    # build the remainder
    result="${TD:=","}${remainder}${result}"
    thousands=$(($thousands / 1000))
  done

  nicenum="${thousands}${result}"
  if [ ! -z $2 ] ; then
    echo $nicenum
  fi
}

DD="." # Decimal point delimiter
TD="," # Thousands delimiter

while getopts "d:t:" opt; do
  case $opt in
    d ) DD="$OPTARG"  ;;
    t ) TD="$OPTARG"  ;;
  esac
done

shift $(($OPTIND - 1))

#input validation
if [ $# -eq  0 ] ; then
  echo "Usage: $(basename $0) [-d c] [-t c] number"
  echo " -d specifies the decimal point delimiter"
  echo " -t specifies the thousands delimiter"
  exit 0
fi

nicenumber $1 1

exit 0