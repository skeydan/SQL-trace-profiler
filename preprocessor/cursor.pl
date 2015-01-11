#!/usr/bin/perl
use strict;
use warnings;
while (<>) {
  if (/^PARSING IN CURSOR/../END OF STMT/) {
    if (/^PARSING IN CURSOR/) {
      s/^PARSING IN CURSOR \#//;
      s/ [a-z]+=/!/g;
      s/\n$/!/;
      $_ = "$.!$_";
    }
    s/\n$/ /;
    unless (/^END OF STMT/) {
      print;
    } 
    if  (/^END OF STMT/) {
      print "\n";
    } 
  }
}

