# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/Session.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Test::Catalyst::Session;
use strict;
use warnings;

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

1;