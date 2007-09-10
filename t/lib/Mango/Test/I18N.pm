# $Id: /local/Mango/trunk/t/lib/Mango/Test/I18N.pm 181 2007-05-20T19:33:04.774686Z claco  $
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