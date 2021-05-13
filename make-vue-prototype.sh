#! /bin/bash
read -p "directory name:" NAME
[[ -d $NAME ]] && echo "Directory namespace taken. Try another name" && exit
mkdir $NAME
cd $NAME
touch App.vue
touch data.json
mkdir components pages
echo "{
  "\""players"\"": [
    "\""Curry"\"",
    "\""Lillard"\"",
    "\""Durant"\"",
    "\""James"\"",
    "\""Antentenkumpo"\""
  ],
  "\""teams"\"": [
    "\""Warriors"\"",
    "\""Blazers"\"",
    "\""Nets"\"",
    "\""Lakers"\"",
    "\""Bucks"\""
  ]
}" > data.json
ls -a
echo "Shell ID:"$$
vue serve
