#! /bin/bash
#  validfloat--Tests whether a number is a floating-point value.
#   Does not handle scientific notation

# 1) separate value into two parts: integer and fractional
# 2) test the integer to see if it's a valid int
# 3) test the fractional part (valid >=0 integer)
test
. validint.sh
validfloat()
{
  fvalue="$1"
  # check if number is float (does it have . ?)
  if [ ! -z $(echo $fvalue | sed 's/[^.]//g') ] ; then
    # cut the value to extract echoed integer before decimal
    decimalPart="$(echo $fvalue | cut -d. -f1)"
    # extract the digits following the decimal
    fractionalPart="${fvalue#*\.}"
    # test if decimalPart is valid integer
    if [ ! -z $decimalPart ] ; then
      if ! validint "$decimalPart" "" "" ; then # reverse test logic (!) & call validint script with blank args for min/max
        return 1
      fi
    fi
    # test if fractionalPart is valid (no minus signs present)
    if [ "${fractionalPart}%${fractionalPart#?}}" = "-" ] ; then
      echo "Invalid floating-point number: '-' not allowed \ 
        after decimal point." >&2
      return 1
    fi
    # test if fractional part exists
    if [ "$fractionalPart" != "" ] ; then
      # test the validitiy of the fractional part with 0 as the min
      if ! validint "$fractionalPart" "0" "" ; then
        return 1
      fi
    fi
  else
    #if the entire value is just "-", block that.
    if [ "$fvalue" = "-" ] ; then
      echo "invalid floating point number format." >&2
      return 1
    fi

    # Check that remaining digits are valid integers
    if ! validint "$fvalue" "" "" ; then
      return 1
    fi
  fi

    return 0
}

if validfloat $1; then
  echo "$1 is valid"
fi
exit 0