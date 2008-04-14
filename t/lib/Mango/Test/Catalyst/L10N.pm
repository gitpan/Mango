# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/L10N.pm 1528 2008-04-14T01:08:40.114508Z claco  $
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