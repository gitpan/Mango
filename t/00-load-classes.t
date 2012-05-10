use Test::More;

use strict;
use warnings;
 
plan $ENV{TEST_MONGODBI} ?
    (tests => 6) :
    (skip_all => 'TEST_MONGODBI is not set. Tests skipped.') ;

# test loading modules, roles, etc
sub load_class {
    
    my $class = shift;
    
    eval "require $class";
    
    return $@ ? 0 : 1;
    
}

ok load_class('Mango'),

    'Mango loaded';

ok load_class('Mango::Application'),

    'Mango::Application loaded';

ok load_class('Mango::Document'),

    'Mango::Document loaded';

ok load_class('Mango::Document::Child'),

    'Mango::Document::Child loaded';

ok load_class('Mango::Document::Relative'),

    'Mango::Document::Relative loaded';

ok load_class('Mango::Document::Storage::Criterion'),

    'Mango::Document::Storage::Criterion loaded';
