#!perl -w
# $Id: /local/CPAN/Mango/t/pod_coverage.t 1528 2008-04-14T01:08:40.114508Z claco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Mango::Test;

    plan skip_all => 'set TEST_AUTHOR to enable this test' unless $ENV{TEST_AUTHOR};

    eval 'use Test::Pod::Coverage 1.04';
    plan skip_all => 'Test::Pod::Coverage 1.04 not installed' if $@;

    eval 'use Pod::Coverage 0.14';
    plan skip_all => 'Pod::Coverage 0.14 not installed' if $@;
};

my $trustme = {
    trustme =>
    [qr/^(ACCEPT_CONTEXT|COMPONENT|destroy|setup|create_result|type|save|begin|end|auto)$/]
};

all_pod_coverage_ok($trustme);
