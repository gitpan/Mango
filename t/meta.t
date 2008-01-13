#!perl -w
# $Id: /local/CPAN/Mango/t/meta.t 1187 2008-01-13T03:25:07.767826Z claco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Mango::Test;

    plan skip_all => 'set TEST_AUTHOR to enable this test' unless $ENV{TEST_AUTHOR};
    plan skip_all => 'run make manifest to generate META.yml' unless -e 'META.yml';

    eval 'use Test::YAML::Meta';
    plan skip_all => 'Test::YAML::Meta not installed' if $@;
};

meta_yaml_ok();
