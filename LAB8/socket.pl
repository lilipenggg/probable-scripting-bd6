#!/usr/bin/perl -w
# Lili Peng
# Lab 8 - Sockets
# CS3030 - Scripting Language
use strict;
use warnings;
use IO::Socket;

if (@ARGV != 2)
{
	print STDERR "Usage: ./socket.pl 'HOSTNAME' 'SOCKETNUMBER'\n";
	exit(1);
}

my $remote = IO::Socket::INET->new(
	Proto => "tcp",
	PeerAddr => "$ARGV[0]",
	PeerPort => "socket($ARGV[1])", )
	or die "Error: failed to connect to the provided socket at the privated host.";

my $line = <$remote>;
print $line;
exit(0);
