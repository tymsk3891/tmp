#!/usr/bin/perl

my $USAGE = "USAGE: $0 ACCESSION_NUMBER\n";

my $accession;
if(@ARGV == 1){
        $accession = $ARGV[0];
        print "$accession\n";
}else{
        print "ACCESSION NUMBER not set.\n";
        print "$USAGE";
        exit 1;
}


my $get_flag = 0;
while(my $line = <STDIN>){

	if($get_flag == 1){
		print $line;
		if($line =~ /^\/\//){
			last;
		}
		else{
			next;
		}
	}

	if($line =~ /^LOCUS/ and $line =~ /$accession/){
		$get_flag = 1;
		print $line;
	}
}

exit;
