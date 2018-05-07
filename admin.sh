#!/bin/bash

sayHello() {
echo "Hello!"
echo "1. Database"
echo "2. License"
echo "3. BackUp"
echo "4. Exit"

#ACTION=4

read -p 'Enter value [4]:' ACTION
ACTION=${ACTION:-4}
#echo $ACTION

case "$ACTION" in
  1)
    ACTION_VALUE='DATABASE'
    createDatabase
  ;;
  2)
    ACTION_VALUE='LICENSE'
  ;;
  3)
    ACTION_VALUE='BACKUP'
  ;;
  4)
    ACTION_VALUE='EXIT'
    exit 0
  ;;
esac
echo $ACTION_VALUE
}

createDatabase() {
  echo "create database"
  read -p 'Y/N [N]:' ACTION
  ACTION=${ACTION:-N}
  echo $ACTION
  sayHello
}

sayHello

usage() { echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1; }

while getopts ":s:p:" o; do
    case "${o}" in
        s)
            s=${OPTARG}
#            ((s == 45 || s == 90)) || usage
            ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${s}" ] || [ -z "${p}" ]; then
#    usage
echo "Empty var"
fi

echo "s = ${s}"
echo "p = ${p}"
