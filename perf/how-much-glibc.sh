#!/bin/bash
#Sum the usage of glibc libraries on benchtests and save in a file
#It assumes you exported the perf reports on a txt file and saved
#in a comon directory.
#
# $1 - directory with all files

if [[ -z $1 ]]; then
	echo "Missing directory argument"
	exit 1
fi

for file in ./$1/*.txt;
do
	cat $file | grep -e libc -e libm | awk -v f=$(basename $file) 'BEGIN {sum = 0} $2 >= 0.01 {sum+=$2} END{print f ";" sum "%"}' >> $1.csv
done
