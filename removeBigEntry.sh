#!/bin/sh


if [[ $1 =~ .gz$ ]]; then
	low_seq=`echo $1 | sed -e 's@.gz@.low@g'`
	high_seq=`echo $1 | sed -e 's@.gz@.high@g'`
	zcat $1 | perl removeBigEntry.pl > $low_seq 2> $high_seq
else
	echo "USAGE:$0 .gz file"
	exit 1
fi

