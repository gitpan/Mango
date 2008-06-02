# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Cart/Path.pm 1644 2008-06-02T01:46:53.055259Z claco  $
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
