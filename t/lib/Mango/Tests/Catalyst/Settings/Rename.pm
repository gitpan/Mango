# $Id: /local/CPAN/Mango/t/lib/Mango/Tests/Catalyst/Settings/Rename.pm 1644 2008-06-02T01:46:53.055259Z claco  $
package Mango::Tests::Catalyst::Settings::Rename;
use strict;
use warnings;

BEGIN {
    use base 'Mango::Tests::Catalyst::Settings';

    use Test::More;
    use Path::Class ();
}

sub config_application {
    my $self = shift;

    my $cfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Settings.pm');
    my $ncfile = Path::Class::file($self->application, 'lib', 'TestApp', 'Controller', 'Preferences.pm');
    my $contents = $cfile->slurp;
        
    $contents =~ s/package TestApp::Controller::Settings;/package TestApp::Controller::Preferences;/;

    $cfile->remove;
    $ncfile->openw->print($contents);
}

sub path {'preferences'};

1;
