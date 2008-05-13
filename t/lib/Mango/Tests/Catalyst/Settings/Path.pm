# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Settings/Path.pm 1578 2008-05-10T01:30:21.225794Z claco  $
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
