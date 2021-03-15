#!/bin/bash

data_file="$2"

collect() {
  time/tst-cpuclock1 >> cpuclock.tmp
}

process() {
  cat cpuclock.tmp | awk '
    /^pbefore/ {printf "%s;", $2}
    /^pnanosleep/ {printf "%s;", $2}
    /^pdead/ {printf "%s\n", $2}' >> $data_file
}

count=0

while [ $count -lt $1 ];
do
  echo -e -n "\rRuninng $(($count+1))/$1"
  count=$(($count+1))
  collect
done

process
echo -e "\nFinished"
