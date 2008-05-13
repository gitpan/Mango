# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Products/Path.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Tests::Catalyst::Products::Path;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Products';

    use Test::More;
}

sub config {
    { 'Controller::Products' => { path => shift->path } };
}

sub path {'parts'};

1;
