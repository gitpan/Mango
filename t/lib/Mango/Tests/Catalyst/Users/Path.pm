# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Users/Path.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Tests::Catalyst::Users::Path;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Users';

    use Test::More;
}

sub config {
    { 'Controller::Users' => { path => shift->path } };
}

sub path {'people'};

1;
