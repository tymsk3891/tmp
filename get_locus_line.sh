#!/bin/sh

ddbj_seqgz=$1
if [ -f $ddbj_seqgz ]; then
	ddbj_locus=`echo $ddbj_seqgz | sed -e 's@seq.gz@locus@g'`
	zcat $ddbj_seqgz | grep "^LOCUS" > $ddbj_locus
fi

