#!/bin/perl

use strict;
use warnings;

my $MAX_COUNT = 3;
my $i = 0;
while (my $line = <STDIN>){
	if ($line =~ /^LOCUS/){
		$i++;
	}
	if ($i > $MAX_COUNT){
		last;	
	}	
	print $line;
}

