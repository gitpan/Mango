# $Id: /local/Mango/trunk/t/lib/Mango/Test/I18N/en.pm 182 2007-05-21T00:26:53.854487Z claco  $
package Mango::Test::I18N::en;
use strict;
use warnings;
use utf8;
use vars qw/%Lexicon/;

BEGIN {
    use base qw/Mango::Test::I18N/;
};

%Lexicon = (
    Language => 'Test English Language',
);

1;
