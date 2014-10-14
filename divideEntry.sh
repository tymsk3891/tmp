#!/bin/sh

flat_file=$1
if [ ! -f $flat_file ]; then
	echo "Usage: $0 flat_file"
fi

origin_line_no=`grep -n "^ORIGIN" $flat_file | sed -e 's/:.*//'`
sed -n "1,${origin_line_no}p" $flat_file > ${flat_file}.head


tail_line_no=`grep -n "^\/\/" $flat_file | sed -e 's/:.*//'`
seq_start_line_no=`expr ${origin_line_no} + 1`
seq_tail_line_no=`expr ${tail_line_no} - 1`
sed -n "${seq_start_line_no},${seq_tail_line_no}p" $flat_file > ${flat_file}.origin

tail -1 $flat_file > ${flat_file}.tail

