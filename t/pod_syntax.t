#!perl -w
# $Id: /local/CPAN/Mango/t/pod_syntax.t 1578 2008-05-10T01:30:21.225794Z claco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Test::More;

    plan skip_all => 'set TEST_AUTHOR to enable this test' unless $ENV{TEST_AUTHOR};

    eval 'use Test::Pod 1.00';
    plan skip_all => 'Test::Pod 1.00 not installed' if $@;
};

all_pod_files_ok();
