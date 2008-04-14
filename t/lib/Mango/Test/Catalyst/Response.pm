# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/Response.pm 1528 2008-04-14T01:08:40.114508Z claco  $
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