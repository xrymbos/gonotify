#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

my $id=30570;
my $oldlines=0;

while(1){
   print "updating\n";
   my $new = get("http://www.online-go.com/games/notifier.php?userID=$id");
   my $newlines=($new =~ tr/\n//);
   if($newlines > $oldlines){
      system("notify-send -t 1000000000 OGS \"$new\"");
   }
   print "old: $oldlines\nnew: $newlines\n";
   $oldlines=$newlines;
   sleep 60;
}
