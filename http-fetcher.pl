#!/usr/bin/perl

$tivoip=$ARGV[0];
$showID=$ARGV[1];
$showNAME=$ARGV[2];
$MAK=$ARGV[3];
$target=$ARGV[4];

$TivoDir = "$ENV{'USER'}";
$TivoDir =~ tr/ :\//_../;
$TivoDir = "/tmp/iTiVo-$TivoDir";

$cookiepatch = "echo \'$tivoip	FALSE	/	FALSE	9960972800	sid	0000000000000000\' \> /tmp/tivocookie";
$shellScript = "curl \'http://$tivoip\:80/download/$showNAME\.TiVo?Container=%2FNowPlaying&id=$showID\' -b /tmp/tivocookie --retry 12 --retry-delay 10 --digest -u tivo:$MAK -o $target --stderr $TivoDir/iTiVoDL";

print "$cookiepatch\n";
system($cookiepatch);
print "$shellScript\n";
system($shellScript);

print "$result\n";
