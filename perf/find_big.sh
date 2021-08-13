#!/bin/bash
#Look on all directories within the current for .txt files. It will assume this
#.txt files are perf reports exported to .txt. It will compile in a file called
#'big.txt' all the libc or libm funcions used more that 5%.

for file in ./*/*.txt;
do
	cat $file | grep -e libc -e libm | grep -v "main" | grep -v "#" | awk  -v filename="${file}" '$2 > 5 { print filename ";" $2 ";" $5 ";" $7 ";" $3}' >> big.txt
done
