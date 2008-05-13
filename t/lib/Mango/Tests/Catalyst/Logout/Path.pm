# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Logout/Path.pm 1578 2008-05-10T01:30:21.225794Z claco  $
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
