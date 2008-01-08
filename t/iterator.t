#!perl -wT
# $Id: /local/CPAN/Mango/trunk/t/iterator.t 1959 2007-08-10T05:27:29.884596Z claco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Mango::Test tests => 6;

    use_ok('Mango::Iterator');
};


## create a new iterator without a hash
{
    my $iterator = Mango::Iterator->new;
    is(ref $iterator, 'Mango::Iterator');
};


## create a new iterator with array
{
    my $iterator = Mango::Iterator->new({
        data => []
    });
    is(ref $iterator, 'Mango::Iterator::List');
};


## create a new iterator with Handel::Iterator
{
    my $iterator = Mango::Iterator->new({
        data => bless({}, 'Handel::Iterator')
    });
    is(ref $iterator, 'Mango::Iterator::HandelResults');
};


## create a new iterator with other blessed object
{
    my $iterator = Mango::Iterator->new({
        data => bless({}, 'Junk')
    });
    is(ref $iterator, 'Mango::Iterator');
};


## create result just returns result
{
    my $iterator = Mango::Iterator->new;
    is(ref $iterator->create_result(bless({}, 'Junk')), 'Junk');
};
