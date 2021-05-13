#! /bin/bash
function addThis() {
  read -p "Add: " NUM1
  read -p "To: " NUM2
  echo $(($NUM1+$NUM2))
}
function factorial() {
  if (( $1 <= 1)); then
    echo 1
  else
    last=$(factorial $(( $1 - 1 )))
    echo $(( $1 * last ))
  fi
}
function commission() {
  read -p "List Price: " PRICE
  awk "BEGIN {x=.025; y=$PRICE; z=x*y; print z}"
}
read -p "what do you want to do: add/factorialize/commission " ISSUE
case $ISSUE in
  [a][d][d])
    addThis
    ;;
  [f][a][c][t][o][r][i][a][l][i][z][e])
    read -p "find the factor of: " NUM1
    factorial $NUM1
    ;;
  [c][o][m][m][i][s][s][i][o][n])
    commission
    ;;
  *)
    echo "Not allowed"
esac