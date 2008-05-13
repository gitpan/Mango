# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Login/Path.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Tests::Catalyst::Login::Path;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Login';

    use Test::More;
}

sub config {
    { 'Controller::Login' => { path => shift->path } };
}

sub path {'auth'};

1;
