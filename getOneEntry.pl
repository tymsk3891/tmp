#!/usr/bin/perl

my $get_flag = 0;
while(my $line = <>){

	if($get_flag == 1){
		print $line;
		if($line =~ /^\/\//){
			last;
		}
		else{
			next;
		}
	}

	if($line =~ /^LOCUS/ and $line =~ /"locus number here!"/){
		$get_flag = 1;
		print $line;
	}
}

exit;
