# $Id: /local/CPAN/Mango/lib/Mango/Catalyst/Controller/Root.pm 1578 2008-05-10T01:30:21.225794Z claco  $
package Mango::Catalyst::Controller::Root;
use strict;
use warnings;

BEGIN {
    use base qw/Catalyst::Controller/;

    __PACKAGE__->config->{'namespace'} = '';
}

sub index : Template('index') {
    my ( $self, $c ) = @_;

    return;
}

sub default : Template('errors/404') {
    my ( $self, $c ) = @_;

    $c->response->status(404);

    return;
}

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;

    return;
}

1;
__END__

=head1 NAME

Mango::Catalyst::Controller::Root - Catalyst controller for the homepage

=head1 SYNOPSIS

    package MyApp::Controller::Root;
    use base 'Mango::Catalyst::Controller::Root';

=head1 DESCRIPTION

Mango::Catalyst::Controller::Root provides the web interface for
the homepage.

=head1 ACTIONS

=head2 default : /

Displays the not found page for non-exisistent urls.

=head2 end

Sends the request to the RenderView action.

=head2 index : /

Displays the current homepage.

=head1 AUTHOR

    Christopher H. Laco
    CPAN ID: CLACO
    claco@chrislaco.com
    http://today.icantfocus.com/blog/

