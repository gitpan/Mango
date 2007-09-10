# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/L10N/en.pm 182 2007-05-21T00:26:53.854487Z claco  $
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
