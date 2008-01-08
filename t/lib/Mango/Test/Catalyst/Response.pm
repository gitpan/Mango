# $Id: /local/CPAN/Mango/trunk/t/lib/Mango/Test/Catalyst/Response.pm 1959 2007-08-10T05:27:29.884596Z claco  $
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