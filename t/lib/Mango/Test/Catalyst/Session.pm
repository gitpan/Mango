# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/Session.pm 292 2007-05-23T12:43:58.197522Z CLaco  $
package Mango::Test::Catalyst::Session;
use strict;
use warnings;

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

1;