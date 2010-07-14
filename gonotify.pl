#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;
use Gtk2::Notify -init, "app_name";

my $id=30570;
my $oldlines=0;

while(1){
   print "updating\n";
   my $new = get("http://www.online-go.com/games/notifier.php?userID=$id");
   my $newlines=($new =~ tr/\n//);
   if($newlines > $oldlines){
       my $notification=Gtk2::Notify->new("OGS",$new);
       $notification->set_timeout(1000000000); 
       $notification->show;
   }
   print "old: $oldlines\nnew: $newlines\n";
   $oldlines=$newlines;
   sleep 60;
}
