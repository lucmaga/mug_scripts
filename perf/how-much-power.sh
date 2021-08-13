#!/bin/bash
#Process a perf report in txt format to a csv with only glibc power functions
#This script assumes you have a bunch of directories with the perf report
#inside.

for file in ./*/*.txt;
do
	cat $file | grep libc | grep power | awk  '$1 ~ /[0-9]/ { print $1 ";" $5 ";" $7 ";" $3}' > ${file%.txt}.csv
done
