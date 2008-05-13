# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/Response.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Test::Catalyst::Response;
use strict;
use warnings;

BEGIN {
    use base qw/Class::Accessor::Grouped/;
    __PACKAGE__->mk_group_accessors('simple', qw/content_type body/);
};

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

1;