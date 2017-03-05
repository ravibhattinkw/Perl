#!/usr/bin/perl
use Path::Class;
use strict;
use warnings;

my $filename = 'Raveendra_Seetharam.rtf';
my $find1 = 'blackberry';
my $find2 = 'Blackberry';
my $find3 = 'BlackBerry';
my $replace = $find2;

print "file: $filename \n";

open (my $fh, '<:encoding(UTF-8)',$filename) or die "could not open '$filename' $!";

my @line = <$fh>;
close $fh;
print "line matching $find1 or $find2 \n";

my $count = 0;
#my @slurp;

#write Replaced contents to a temp.txt file
open (my $outfile_fh, '+>', "Out.rtf") or die "Can't open > output.txt: $!";   

sub FindReplace($;$;$) {
      my $_ = $_[0];
      my $find = $_[1];
      my $replace = $_[2];
      
      #print "\nline Before replacing $find by $replace is $_ \n";
      my $pos = index($_, $find);
      while ($pos > -1) {
			substr($_,$pos,length($find),$replace);
			$pos = index ($_, $find, $pos + length($replace));
      }
      #s/$find/$replace/gi;
      
      print $outfile_fh "$_ \n";
      #print "\nline after replacing $find is $_ \n";
      return;
}

foreach (@line)
{
   my $line = $_;
   chomp($line); 
   
   if ( $line =~ /$find1/ )
   {
      #print "\n $_\n";
      $count = $count +1;
      print "count = $count \n";
      &FindReplace($line,$find1,$replace);
   } 
   elsif ( $line =~ /$find3/ )
   {
      #print "\n $_\n";
      $count = $count +1;
      print "count = $count \n";
      &FindReplace($line,$find3,$replace);
   } 
   elsif ( $line =~ /$find2/ )
   {
	  # print "\n $_\n";
      $count = $count +1;
      print "count = $count \n";
      print $outfile_fh "$_ \n";
   }
   else {
	  print $outfile_fh "$_ \n";
   }
}

close $outfile_fh;
print "count = $count \n";
exit;