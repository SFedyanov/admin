#!/bin/bash
#START DESCRIPTION
#PARAMETERS:
#-h hostname
#HOST=$1
#PORT=$2
#USERNAME=$3
#PASSWORD=$4
#SCHEMA_NAME=$5
#END DESCRIPTION

usage() {
echo "Usage: $0 -h <<hostname>> -p <<portnumber>> -d <<databasename>>" \
 1>&2; exit 1;
}

while getopts ":h:p:d:" o; do
    case "${o}" in
        h)
            h=${OPTARG}
            ;;
        p)
            p=${OPTARG}
            ;;
        d)
            d=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${h}" ] || [ -z "${p}" ] || [ -z "${d}" ]; then
    usage
fi


main() {
  echo "host name = ${h}"
  echo "port number = ${p}"
  echo "database name = ${d}"
}

main
