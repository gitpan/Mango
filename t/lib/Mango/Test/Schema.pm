# $Id: /local/CPAN/Mango/trunk/t/lib/Mango/Test/Schema.pm 1959 2007-08-10T05:27:29.884596Z claco  $
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
