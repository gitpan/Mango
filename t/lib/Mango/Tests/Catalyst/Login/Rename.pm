# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Login/Rename.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Tests::Catalyst::Login::Rename;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Login';

    use Test::More;
    use Path::Class ();
}

sub config_application {
    my $self = shift;

    my $cfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Login.pm');
    my $ncfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Authorize.pm');
    my $contents = $cfile->slurp;
        
    $contents =~ s/package TestApp::Controller::Login;/package TestApp::Controller::Authorize;/;

    $cfile->remove;
    $ncfile->openw->print($contents);
}

sub path {'authorize'};

1;
