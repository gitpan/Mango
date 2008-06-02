# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Settings/Path.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Tests::Catalyst::Settings::Path;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Settings';

    use Test::More;
}

sub config {
    { 'Controller::Settings' => { path => shift->path } };
}

sub path {'preferences'};

1;
