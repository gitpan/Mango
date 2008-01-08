# $Id: /local/CPAN/Mango/trunk/t/lib/Mango/Test/Catalyst/L10N/en.pm 1959 2007-08-10T05:27:29.884596Z claco  $
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
