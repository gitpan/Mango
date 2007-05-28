# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/I18N/en.pm 231 2007-05-21T00:35:14.661116Z claco  $
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
