# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Users/Path.pm 1578 2008-05-10T01:30:21.225794Z claco  $
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
