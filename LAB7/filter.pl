#!/usr/bin/perl
# Lili Peng
# Lab7 Perl Filter
# CS3030 - Scripting

if (@ARGV != 2)
{
	print STDERR "Usage ./filter.pl 'FROMSTRING' 'TOSTRING';
}

open(STDIN, "<", $ARGV[0]);

while(<STDIN>)
{
	s/$ARGV[0]/eval qq("$ARGV[1]")/ge;
	print "$_";
}
exit(0);
