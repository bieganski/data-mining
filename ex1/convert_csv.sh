#!/bin/bash

set -e
# set -u
set -x


data_fname=clash_royale_games_Jan_2019.csv
num=100000
res_fname="res.csv"



header=`head -n 1 $data_fname`



BASIC=0

while [ "$1" != "" ]; do
    case $1 in
        --basic)
            BASIC=1
            ;;
        *)
	    echo "ARGS ERROR"
	    exit 1
	    ;;
    esac
    shift
done


set -u



echo $header > $res_fname

tmp=`mktemp`

# skip header
tail -n +2 $data_fname > $tmp
shuf -n $num $tmp >> $res_fname

if [ $BASIC -eq 1 ]; then
        cmd="cut -d , -f 1,5"
	cat $res_fname | $cmd | tr '_' ',' > $tmp
	cat $tmp > $res_fname
fi
echo "Done! file $res_fname is ready."
