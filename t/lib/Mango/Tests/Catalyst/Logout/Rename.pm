# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Logout/Rename.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Tests::Catalyst::Logout::Rename;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Logout';

    use Test::More;
    use Path::Class ();
}

sub config_application {
    my $self = shift;

    my $cfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Logout.pm');
    my $ncfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'DeAuthorize.pm');
    my $contents = $cfile->slurp;
        
    $contents =~ s/package TestApp::Controller::Logout;/package TestApp::Controller::DeAuthorize;/;

    $cfile->remove;
    $ncfile->openw->print($contents);
}

sub path {'deauthorize'};

1;
