#!/usr/bin/perl -w

# acs.pl
#
# 06/18/07 09:19:54 CEST Dobrica Pavlinusic <dpavlin@rot13.org>

use strict;

use lib './lib';
use CWMP::Server;
use Getopt::Long;

my $port = 3333;
my $debug = 0;
my $store_path = 'state.db';

GetOptions(
	'debug+' => \$debug,
	'port=i' => \$port,
	'store-path=s' => \$store_path,
);

my $server = CWMP::Server->new({
	port => $port,
	store_path => $store_path,
	debug => $debug,
	default_queue => [ qw/
		GetRPCMethods
		GetParameterNames
	/ ],
#		Reboot
});
$server->run();
