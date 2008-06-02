# $Id: /local/CPAN/Mango/t/lib/Mango/Test/I18N.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Test::I18N;
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