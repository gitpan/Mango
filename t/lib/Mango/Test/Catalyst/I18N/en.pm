# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/I18N/en.pm 1644 2008-06-02T01:46:53.055259Z claco  $
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
