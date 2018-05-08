main1() {
  array=$(ls bin/* | xargs -n 1 basename | sed -e 's/\..*$//')
  echo $array
  PS3='Please enter your choice: '
  select opt in $array
  do
    echo $opt
  done

  x="/foo/fizzbuzz.bar"
  y=${x%.bar}
  echo ${y##*/}

  PS3='Please enter your choice1: '
  select FILENAME in bin/*;
  do
    echo ${FILENAME##*/}
  done

  PS3='Please enter your choice2: '
  options=("Option 1" "Option 2" "Option 3" "Quit")
  select opt in "${options[@]}"
  do
      case $opt in
          "Option 1")
              echo "you chose choice 1"
              ;;
          "Option 2")
              echo "you chose choice 2"
              ;;
          "Option 3")
              echo "you chose choice 3"
              ;;
          "Quit")
              break
              ;;
          *) echo invalid option;;
      esac
  done

echo "Hello!"
echo "1. Database"
echo "2. License"
echo "3. BackUp"
echo "4. Exit"

read -p 'Enter value [4]:' ACTION
ACTION=${ACTION:-4}

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

#echo $opt
#echo "array: $(echo "$array" | tr '\n' ' ')"
#echo "opt: $opt"
#if echo "$array" | tr '\n' ' ' | grep "$opt" >/dev/null ; then
#    echo "ok"
#fi


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


createDatabase() {
  echo "create database"
  read -p 'Y/N [N]:' ACTION
  ACTION=${ACTION:-N}
  echo $ACTION
  sayHello
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
      loadDatabase
    ;;
    *)
      ACTION_VALUE='EXIT'
      echo "Not correct choice"
      exit 0
    ;;

  esac
}
