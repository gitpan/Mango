# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/Log.pm 309 2007-05-29T15:19:54.893692Z claco  $
package Mango::Test::Catalyst::Log;
use strict;
use warnings;

BEGIN {
    use base qw/Class::Accessor::Grouped/;
    __PACKAGE__->mk_group_accessors('simple', qw/debug/);
};

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

sub error {
    my $self = shift;

    die shift;
};

1;