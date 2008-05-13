# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/Log.pm 1578 2008-05-10T01:30:21.225794Z claco  $
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

sub warn {
    warn @_;
};

1;
