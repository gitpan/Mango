# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Products/Path.pm 1644 2008-06-02T01:46:53.055259Z claco  $
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
