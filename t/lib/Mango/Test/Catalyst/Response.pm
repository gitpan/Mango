# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/Response.pm 239 2007-05-23T02:39:43.357971Z claco  $
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