# $Id: /local/CPAN/Mango/trunk/t/lib/Mango/Test/Catalyst/L10N.pm 1959 2007-08-10T05:27:29.884596Z claco  $
package Mango::Test::Catalyst::L10N;
use strict;
use warnings;
use utf8;
use vars qw/@EXPORT_OK %Lexicon $handle/;

BEGIN {
    use base qw/Locale::Maketext Exporter/;
};

@EXPORT_OK = qw(translate);

%Lexicon = (
    _AUTO => 1
);

1;