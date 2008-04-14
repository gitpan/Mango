# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Schema.pm 1528 2008-04-14T01:08:40.114508Z claco  $
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
