# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/I18N/en.pm 1528 2008-04-14T01:08:40.114508Z claco  $
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
