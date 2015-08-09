#!/bin/bash

DATFILE='./uniprot_sprot.dat'
IDXFILE='./uniprot_sprot.idx'
IFS=','
while read line
do
	set -- $line
	offset=`expr $2 - 1`
	length=`expr $3 - $2`
	output="split_seq/$1.seq"
	dd if=$DATFILE bs=1 skip=${offset} count=${length} > ${output} 2> /dev/null
	
done < $IDXFILE
