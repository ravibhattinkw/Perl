#!/usr/bin/perl
use strict;
use warnings;

#Print X in a matrix form

sub matrixprinting {   
   my $n = $_[0];
   my $k = $n-1;
   my $j = 0;
   my $i = 0;
   
   for ($i = 0; $i < $n; $i++) {
      for ($j=0; $j < $n; $j++)
      {
         if (($i == $j) || ($j == $k)) {
            print "x" . " ";
         }
         else {
            print "_" . " ";
         }
         
      }
      print "\n";
      --$k;
   }
}

my $n = 15;
matrixprinting($n);
exit;