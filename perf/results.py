#!/usr/bin/python3
#Read csv files preprocessed by "how-much-power.sh" and summary the usage
#of functions on a single csv file with the format:
#benchmark;function1;function2;....
#<bench1>;<usage of function1>;<usage of function2>;...
#
#It will fill with 0 if there is no metion of a function for a given benchmark.
#Receive as argument the list of csv files you want to compile.

import sys
import csv
import re

compilation = {}
functions = set([])
benchmarks = set([])
for f in sys.argv[1:]:
    print (f)
    with open(f) as csvfile:
         spamreader = csv.reader(csvfile, delimiter=';')
         bench = re.search('(\d\d\d\.\w*_)', f).group(1)
         if bench not in compilation:
             compilation[bench] = {}
         for r in spamreader:
             compilation[bench][r[2]] = r[3]
             functions.add(r[2])

print (compilation)
print (functions)
functions = sorted(functions)
with open('compilation.csv', 'w') as csvfile:
    writer = csv.writer(csvfile, delimiter=";")
    writer.writerow(['benchmark'] + list(functions))
    for k in compilation.keys():
        values = []
        for f in functions:
            if f in compilation[k]:
                values.append(compilation[k][f])
            else:
                values.append(0.0)
        writer.writerow([k] + values)


