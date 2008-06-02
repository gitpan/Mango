# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/Session.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Test::Catalyst::Session;
use strict;
use warnings;

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

1;