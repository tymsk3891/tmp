#!/usr/bin/python

import sys

f = open(sys.argv[1],'rb')

begin = 1
end = 0
id_ = ''
line = 'dummy'
while line:

	line = f.readline()
	
	if(line[:2] == 'ID'):
		id_ = line.split()[1]

	elif(line[:2] == '//'):
		end = f.tell()
		print '%s,%s,%s' % (id_,begin,end)
		begin = end + 1

f.close()

