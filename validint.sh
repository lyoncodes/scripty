#!/bin/bash
# validint--Validates integer input, allowing negative integers as well

validint()
{
  #Validate first param and test value against second param (min), and/or third param (max). If the value isn't within range or it's NaN, fail
  number="$1"; min="$2"; max="$3"

  # Checks against empty entry
  if [ -z $number ] ; then
    echo "You didn't enter anything. Please enter a number." >&2
    return 1
  fi

  # Check if the first character is a minus symbol (-)
  if [ "${number%${number#?}}" = "-" ] ; then
    testvalue="${number#?}" # Take all but the first character to test
  else
    testvalue="$number"
  fi

  # Create a version of the number that has no digits to test for the presence of a minus symbol.
  nodigits="$(echo $testvalue | sed 's/[[:digit:]]//g')"

  #Check for non-digit characters
  if [ ! -z $nodigits ] ; then
    echo "Invalid number format--must be standard format number." >&2
    return 1
  fi

  # Check for the presence of the min variable
  if [ ! -z $min ] ; then
    # Check if value is smaller than defined min
    if [ "$number" -lt "$min" ] ; then
      echo "Your value must be larger than $min." >&2
      return 1
    fi
  fi
  # Check for the presence of the max variable
  if [ ! -z $max ] ; then
    # Check if value is smaller than defined max
    if [ "$number" -gt "$max" ] ; then
      echo "Your value must be smaller than $max." >&2
      return 1
    fi
  fi
  return 0
}