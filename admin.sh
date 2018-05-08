#!/bin/bash
set -e
trap "exit 0" TERM
export TOP_PID=$$

main() {
  #ACTION=$(printMenu)
  runAction $(printMenu)
  #$ACTION
}

printMenu() {
  fileList=$(ls bin/* | xargs -n 1 basename | sed -e 's/\..*$//')
  fileList="$fileList Quit"
  PS3='Please enter your choice: '
  local opt=""
  while true ; do
    select opt in $fileList
    do
      if test "$opt" = "Quit" ;then
        kill -s TERM $TOP_PID
      fi
      if test "$opt" != "" ;then
        echo $opt
        return
      fi
    done
  done
}

getOptionsArray() {
  echo "$(cat source/$1.json | lib/jq 'keys' | lib/jq -r '.[]')"
}

runAction(){
  #getOptionsArray $1
  #options=$(cat source/$1.json | lib/jq 'keys' | lib/jq -r '.[]')
  for opt in $(getOptionsArray $1)
  #$options
  do
    v=$(cat source/$1.json | lib/jq -r .$opt.default)
    o="$o -$opt $v"
  done
  echo "./bin/$1.sh$o"
  ./bin/$1.sh$o
}

##Start here
main
