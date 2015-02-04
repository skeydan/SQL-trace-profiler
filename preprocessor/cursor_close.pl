#!/usr/bin/perl
use strict;
use warnings;
while (<>) {
  if (/^CLOSE \#/) {
      s/^CLOSE \#//;
      s/[a-z]+=//g;
      s/:/,/g;
      print "$.,$_";
    }
}
