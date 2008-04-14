# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/Session.pm 1528 2008-04-14T01:08:40.114508Z claco  $
package Mango::Test::Catalyst::Session;
use strict;
use warnings;

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

1;