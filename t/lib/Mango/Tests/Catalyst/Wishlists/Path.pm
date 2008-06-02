# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Wishlists/Path.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Tests::Catalyst::Wishlists::Path;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Wishlists';

    use Test::More;
}

sub config {
    { 'Controller::Wishlists' => { path => shift->path } };
}

sub path {'favorites'};

1;
