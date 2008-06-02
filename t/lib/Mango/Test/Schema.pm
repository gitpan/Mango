# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Schema.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Test::Schema;
use strict;
use warnings;

BEGIN {
    use base qw/Mango::Schema/;
};

sub dsn {
    return shift->storage->connect_info->[0];
};

1;
