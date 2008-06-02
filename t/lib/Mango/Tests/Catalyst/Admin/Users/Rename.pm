# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Admin/Users/Rename.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Tests::Catalyst::Admin::Users::Rename;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Admin::Users';

    use Test::More;
    use Path::Class ();
}

sub config_application {
    my $self = shift;

    my $cfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Admin', 'Users.pm');
    my $ncfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Admin', 'People.pm');
    my $contents = $cfile->slurp;
        
    $contents =~ s/package TestApp::Controller::Admin::Users;/package TestApp::Controller::Admin::People;/;

    $cfile->remove;
    $ncfile->openw->print($contents);
}

sub path {'admin/people'};

1;
