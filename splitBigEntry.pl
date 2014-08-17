#!/usr/bin/perl

use strict;
use warnings;

sub get_length {
	my $flatfile = $_[0];
	open(FLATFILE, "< $flatfile") or die("ERROR: $flatfile $!\n");
	my $locus_line = <FLATFILE>; # read locus line
	close(FLATFILE);

	my @field = split(/ +/, $locus_line);
	my $length = $field[2];
	if($length !~ /^[0-9]+$/){
		die("ERROR: length($length) is invalid.");		
	}

	return $length;
}


sub calc_split_num {

	my ($length, $bp_per_entry) = @_;
	if($length !~ /^[0-9]+$/ or $length == 0){
		die("ERROR: length($length) is invalid.");
	}
	if($bp_per_entry !~ /^[0-9]+$/ or $bp_per_entry == 0){
		die("ERROR: bp per entry($bp_per_entry) is invalid.");
	}

	return int($length/$bp_per_entry) + 1;
	
}


my $SPLIT_LENGTH = 300000000;


my $USAGE = "USAGE: $0 flatfilename\n";

my $flatfile;
if(@ARGV == 1){
	$flatfile = $ARGV[0];
	print "$flatfile\n";
}else{
	print "no input FLAT FILE.\n";
	print "$USAGE";
	exit 1;
}


my $length = &get_length($flatfile);
my $split_num = &calc_split_num($length, $SPLIT_LENGTH);

print $split_num;
print "\n";

