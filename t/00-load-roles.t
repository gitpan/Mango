use Test::More;

use strict;
use warnings;
 
plan $ENV{TEST_MONGODBI} ?
    (tests => 5) :
    (skip_all => 'TEST_MONGODBI is not set. Tests skipped.') ;

# test loading modules, roles, etc
sub load_class {
    
    my $class = shift;

    eval { require $class };
    
    return $@ ? 0 : 1;
    
}

ok ! load_class('Mango::Document::Base'),

    'Mango::Document::Base is a role, not directly loadable';

ok ! load_class('Mango::Document::Config'),

    'Mango::Document::Config is a role, not directly loadable';

ok ! load_class('Mango::Document::Storage'),

    'Mango::Document::Storage is a role, not directly loadable';

ok ! load_class('Mango::Document::Sugar'),

    'Mango::Document::Sugar is a role, not directly loadable';

ok ! load_class('Mango::Document::Storage::Operation'),

    'Mango::Document::Storage::Operation is a role, not directly loadable';
