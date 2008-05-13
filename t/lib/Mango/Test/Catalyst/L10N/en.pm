# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/L10N/en.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Test::Catalyst::L10N::en;
use strict;
use warnings;
use utf8;
use vars qw/%Lexicon/;

BEGIN {
    use base qw/Mango::Test::Catalyst::L10N/;
};

%Lexicon = (
    Test => 'Test Catalyst L10N English Language',
);

1;
