#! /bin/bash
read -p "directory name:" NAME
[[ -d $NAME ]] && echo "Directory namespace taken. Try another name" && exit
mkdir $NAME
cd $NAME
touch App.vue
touch data.json
mkdir components pages

# write boilerplate JSON to data.json
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

# write a basic App.vue and redirect it to file
cat <<- _EOF_ > App.vue
<template>
  <h1>$HOSTNAME</h1>
</template>

<script>
  export default {
    name: 'App'
  }
</script>

<style scoped>
</style>

_EOF_
ls -a
echo "Shell ID:"$$
code .
vue serve
