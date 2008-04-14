# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/L10N/en.pm 1528 2008-04-14T01:08:40.114508Z claco  $
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
