#!perl -w
# $Id: /local/CPAN/Mango/t/pod_coverage.t 1578 2008-05-10T01:30:21.225794Z claco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Test::More;

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
