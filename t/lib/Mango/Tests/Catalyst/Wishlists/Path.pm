# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Wishlists/Path.pm 1578 2008-05-10T01:30:21.225794Z claco  $
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
