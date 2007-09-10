# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/Session.pm 187 2007-05-23T02:39:56.855536Z claco  $
package Mango::Test::Catalyst::Session;
use strict;
use warnings;

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

1;