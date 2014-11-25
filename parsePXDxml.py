#!/usr/bin/python

import sys
import xml.etree.ElementTree as ET

xml = sys.argv[1]
tree = ET.parse(xml)

ds = tree.find('DatasetSummary')

if ds != None:
	print "%s\t%s" % (xml,ds.attrib['hostingRepository'])

