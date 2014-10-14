#!/bin/sh

seq_file=$1
if [ ! -f $seq_file ]; then
	echo "Usage: $0 seq_file"
fi

head -5000000 $seq_file > ${seq_file}_0
start_line_no=`expr 5000000 + 1 - 50040 / 60`
end_line_no=`expr $start_line_no + 5000000 - 1`
echo $start_line_no
echo $end_line_no
sed -n "${start_line_no},${end_line_no}p" $seq_file > ${seq_file}_1

start_line_no=`expr $end_line_no + 1 - 50040 / 60`
end_line_no=`expr $start_line_no + 5000000 - 1`
sed -n "${start_line_no},${end_line_no}p" $seq_file > ${seq_file}_2
