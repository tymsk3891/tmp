#!/bin/perl

use strict;
use warnings;

my $OVER_FLAG = 0;
my $LENGTH_LIMITS = 300000000;

while (my $line = <STDIN>){
	if ($line =~ /^LOCUS/){
		my @field = split(/ +/,$line);
		if($field[2] > $LENGTH_LIMITS){
			$OVER_FLAG = 1;
		}else{
			$OVER_FLAG = 0;
		}
	}

	if ($OVER_FLAG){
		print STDERR $line;
	}else{
		print $line;
	}

}

