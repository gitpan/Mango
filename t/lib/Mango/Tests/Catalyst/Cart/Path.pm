# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Cart/Path.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Tests::Catalyst::Cart::Path;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Cart';

    use Test::More;
}

sub config {
    { 'Controller::Cart' => { path => shift->path } };
}

sub path { 'basket' }

1;
