# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/Request.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Test::Catalyst::Request;
use strict;
use warnings;

BEGIN {
    use base qw/Class::Accessor::Grouped/;
    __PACKAGE__->mk_group_accessors('simple', qw/action base content_type uri/);
};

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

sub header {
    return shift->{$_[0]};
};

sub param {
    my ($self, $name) = @_;

    return $self->{$name} if defined $name;
    return keys %{$self};
};

sub method {
    return 'GET';
};

1;