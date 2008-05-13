# $Id: /local/CPAN/Mango/t/lib/Mango/Test/Class.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Test::Class;
use strict;
use warnings;

BEGIN {
    use base 'Test::Class';

    use Mango::Test ();
    use Path::Class ();
}

sub startup : Test(startup) {
    my $self = shift;
    my $app = Mango::Test->mk_app( undef, $self->config || {} );
    my $lib = Path::Class::dir( $app, 'lib' );
    eval "use lib '$lib';";

    $self->application($app);
    $ENV{'CATALYST_DEBUG'} = 0;

    $self->config_application;
    {
        local $SIG{__WARN__} = sub { };
        require Test::WWW::Mechanize::Catalyst;
        Test::WWW::Mechanize::Catalyst->import('TestApp');
    };
}

sub application {
    my ( $self, $application ) = @_;

    if ($application) {
        $self->{'application'} = $application;
    }

    return $self->{'application'};
}

sub config {};

sub config_application {};

sub client {
    return Test::WWW::Mechanize::Catalyst->new;
}

sub path {};

1;
