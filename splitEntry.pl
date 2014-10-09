#!/bin/perl

use strict;
use warnings;

if (@ARGV != 1){
	die "USAGE: perl splitEntry.pl ddbj_flat_file\n";
}

my $split_target = shift @ARGV;

open(TARGET,$split_target) or die "Failed to open $split_target.\n";
while (1){
	my $line = <TARGET>;
	unless ($line){
		last;
	}
	my @field;
	my $locus;
	if ($line =~ /^LOCUS/){
		@field = split(/ +/,$line);
		$locus = $field[1];
	}
	open(SPLIT_FILE,">$split_target.$locus");
	print SPLIT_FILE $line;
	while($line = <TARGET>){
		print SPLIT_FILE $line;
		if ($line =~ /^\/\//){
			last;
		}
	}
	close(SPLIT_FILE);
}

