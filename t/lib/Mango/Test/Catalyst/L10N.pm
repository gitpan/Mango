# $Id: /local/Mango/trunk/t/lib/Mango/Test/Catalyst/L10N.pm 182 2007-05-21T00:26:53.854487Z claco  $
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