#!perl -wT
# $Id: /local/Mango/trunk/t/pod_coverage.t 259 2007-05-28T05:46:50.036668Z claco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Mango::Test;

    plan skip_all => 'set TEST_AUTHOR to enable this test' unless $ENV{TEST_AUTHOR};

    eval 'use Test::Pod::Coverage 1.04';
    plan skip_all => 'Test::Pod::Coverage 1.04' if $@;

    eval 'use Pod::Coverage 0.14';
    plan skip_all => 'Pod::Coverage 0.14 not installed' if $@;
};

my $trustme = {
    trustme =>
    [qr/^(COMPONENT|destroy|setup|create_result|type|save|begin)$/]
};

all_pod_coverage_ok($trustme);
