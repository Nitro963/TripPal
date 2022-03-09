#!/bin/bash

DART_ENV=""

shopt -s lastpipe

env | while IFS= read -r line
do
  name="${line%%=*}"
  if [[ "$name" =~ FLUTTER_(.+) ]]
  then
    value="$(eval echo "\${$name}")"
    DART_ENV+=" --dart-define ${BASH_REMATCH[1]}=\"$value\"";
  fi
done

if [ -z "$1" ]
  then
    echo "You must provide build flavor as script argument!"
else
  option="$(eval echo "$1" | tr '[:upper:]' '[:lower:]')"
  if [[ $option == "dev" ]]
  then
    eval "flutter build apk $DART_ENV --flavor=dev"
  else
    if [[ $option == "prod" ]]
      then
      eval "flutter build apk $DART_ENV --flavor=prod"
    else
      echo "Unexpected argument ($1) supplied!"
    fi
  fi
fi
#DART_ENV=""
#for var in "$@"
#do
#    DART_ENV+=" --dart-define \"$var\""
#done
#eval "flutter build apk $DART_ENV"