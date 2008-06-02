# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Login/Path.pm 1644 2008-06-02T01:46:53.055259Z claco  $
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
