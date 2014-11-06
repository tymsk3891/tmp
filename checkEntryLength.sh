#!/bin/sh

for file in $*
do
	gz=`echo $file | grep "DDBJNEWr.*.dat.gz"`
	if [ ! -z $gz ];then
		output=`echo $gz | sed -e 's/.dat.gz/.len/g'`
		zcat $gz | awk -v gz=$gz 'BEGIN{OFS="	";} /^LOCUS/ {print gz,$2,$3}' > $output
	fi
done

sort -k 3 -n -r *.len | head -10
