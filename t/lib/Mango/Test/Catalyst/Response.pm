# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/Response.pm 292 2007-05-23T12:43:58.197522Z CLaco  $
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