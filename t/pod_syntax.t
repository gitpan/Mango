#!perl -w
# $Id: /local/CPAN/Mango/t/pod_syntax.t 1187 2008-01-13T03:25:07.767826Z claco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Mango::Test;

    plan skip_all => 'set TEST_AUTHOR to enable this test' unless $ENV{TEST_AUTHOR};

    eval 'use Test::Pod 1.00';
    plan skip_all => 'Test::Pod 1.00 not installed' if $@;
};

all_pod_files_ok();
