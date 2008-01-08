# $Id: /local/CPAN/Mango/trunk/t/lib/Mango/Test/Catalyst/Session.pm 1959 2007-08-10T05:27:29.884596Z claco  $
package Mango::Test::Catalyst::Session;
use strict;
use warnings;

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

1;