#! /bin/bash

# FOR LOOP TO RENAME FILES
FILES=$(ls *.*)
read -p "enter prefix to append: " LABEL
for FILE in $FILES
  do
    echo "Renaming $FILE to $LABEL-$FILE"
    mv $FILE $LABEL-$FILE
done