#!/bin/bash
set -e
trap "exit 0" TERM
export TOP_PID=$$

main() {
  action=$(printMenu)
  #echo $result
  choiceAction $action
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

choiceAction() {
  echo "Action... $1"
  case $1 in
    activateLicense)
      ACTION_VALUE='DATABASE'
      echo "activateLicense"
    ;;
    backupDatabase)
      ACTION_VALUE='LICENSE'
      echo "backupDatabase"
    ;;
    loadDatabase)
      ACTION_VALUE='BACKUP'
      echo "loadDatabase"
    ;;
    *)
      ACTION_VALUE='EXIT'
      echo "Not correct choice"
      exit 0
    ;;

  esac
}

##Here Start point
main
