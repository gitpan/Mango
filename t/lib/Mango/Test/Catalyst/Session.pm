# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/Session.pm 239 2007-05-23T02:39:43.357971Z claco  $
package Mango::Test::Catalyst::Session;
use strict;
use warnings;

sub new {
    my $class = shift;

    bless shift || {}, $class;
};

1;