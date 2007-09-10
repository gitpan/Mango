# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/Response.pm 187 2007-05-23T02:39:56.855536Z claco  $
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