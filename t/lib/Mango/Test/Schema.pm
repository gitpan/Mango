# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Schema.pm 1578 2008-05-10T01:30:21.225794Z claco  $
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
