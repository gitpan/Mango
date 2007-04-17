# $Id: /local/Mango/trunk/t/lib/Mango/Test/Schema.pm 150 2007-04-14T02:57:04.324056Z claco  $
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
