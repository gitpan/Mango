# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Logout/Path.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Tests::Catalyst::Logout::Path;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Logout';

    use Test::More;
}

sub config {
    { 'Controller::Logout' => { path => shift->path } };
}

sub path {'deauth'};

1;
