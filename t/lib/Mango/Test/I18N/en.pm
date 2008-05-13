# $Id: /local/CPAN/Mango/t/lib/Mango/Test/I18N/en.pm 1578 2008-05-10T01:30:21.225794Z claco  $
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
