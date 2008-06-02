# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Cart/Rename.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Tests::Catalyst::Cart::Rename;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Cart';

    use Test::More;
    use Path::Class ();
}

sub config_application {
    my $self = shift;

    my $cfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Cart.pm');
    my $cifile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Cart', 'Items.pm');

    my $ncfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Basket.pm');
    my $ncifile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Basket', 'Items.pm');

    my $ccontents = $cfile->slurp;
    my $cicontents = $cifile->slurp;
        
    $ccontents =~ s/package TestApp::Controller::Cart;/package TestApp::Controller::Basket;/;
    $cicontents =~ s/package TestApp::Controller::Cart::Items;/package TestApp::Controller::Basket::Items;/;

    $cfile->remove;
    $cifile->dir->rmtree;

    $ncfile->openw->print($ccontents);
    $ncifile->dir->mkpath;
    $ncifile->openw->print($cicontents);
}

sub path {'basket'};

1;
