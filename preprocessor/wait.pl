#!/usr/bin/perl
use strict;
use warnings;
while (<>) {
  if (/^WAIT \#/) {
      s/^WAIT \#//;
      s/(\d+): nam=(.+) ela= (\d+) ([^=]+)=(\d+) ([^=]+)=(\d+) ([^=]+)=(\d+) ([^=]+)=(-?\d+) tim=(\d+)/$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12/;
      print "$.,$_";
    }
}
