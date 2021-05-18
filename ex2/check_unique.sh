#!/bin/bash

set -e

f=$1 # test_data_tabular_format.csv

num=5
if [ "$f" == "" ]; then
	echo "error: no param fname passed!"
	exit 1
fi

for i in `seq 1 198`; do
	cat $f | cut -d , -f $i | uniq -c | head -n $num #   | grep -C5 386
	echo ""
done
