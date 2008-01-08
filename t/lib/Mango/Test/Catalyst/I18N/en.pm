# $Id: /local/CPAN/Mango/trunk/t/lib/Mango/Test/Catalyst/I18N/en.pm 1959 2007-08-10T05:27:29.884596Z claco  $
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
