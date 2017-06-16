#!/usr/bin/perl
system("./soloscoind", "setgenerate", "true", "-1");
if ( $? == -1 )
{exit;}
my @counter;
use JSON qw( decode_json );
$x= `./soloscoind getinfo`;
$counter[0]=decode_json($x)->{"blocks"};
for(my $i=0;$counter[$i]<=($counter[0]+2);$i++)
{
$x= `./soloscoind getinfo`;
my $decoded = decode_json($x);
$counter[$i+1] = $decoded->{"blocks"};
print $i."\n";
print $counter[$i+1];
print $counter[0]+3;
sleep(10);
}
system("./soloscoind", "setgenerate", "false");
exit;
