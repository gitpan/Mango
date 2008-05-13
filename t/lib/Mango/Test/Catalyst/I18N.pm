# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Catalyst/I18N.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Test::Catalyst::I18N;
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