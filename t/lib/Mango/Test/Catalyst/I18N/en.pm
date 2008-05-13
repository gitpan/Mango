# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/I18N/en.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Test::Catalyst::I18N::en;
use strict;
use warnings;
use utf8;
use vars qw/%Lexicon/;

BEGIN {
    use base qw/Mango::Test::Catalyst::I18N/;
};

%Lexicon = (
    Test => 'Test Catalyst I18N English Language',
);

1;
