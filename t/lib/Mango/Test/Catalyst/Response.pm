# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/Response.pm 1644 2008-06-02T01:46:53.055259Z claco  $
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