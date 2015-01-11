#!/usr/bin/perl
use strict;
use warnings;
while () {
  if (/^(PARSE|EXEC|FETCH) \#/) {
      s/^(PARSE|EXEC|FETCH) \#(.+)/$1,$2/;
      s/[a-z]+=//g;
      s/:/,/g;
      print "$.,$_";
    }
}
