# $Id$
package Mango::Checkout::Plugins::Initialize;
use strict;
use warnings;

BEGIN {
    use base 'Handel::Checkout::Plugin';
    use Handel::Constants qw(:checkout);
}

sub register {
    my ( $self, $ctx ) = @_;

    $ctx->add_handler( CHECKOUT_PHASE_INITIALIZE, \&initialize, 10 );

    return;
}

sub initialize {
    my ( $self, $ctx ) = @_;

    use Carp ();
    Carp::carp 'INIT FROM MANGO PLUGIN';

    return CHECKOUT_HANDLER_OK;
}

1;
__END__

=head1 NAME

Mango::Checkout::Plugins::Initialize - Mango checkout plugin to initiate order options.

=head1 SYNOPSIS

    my $checkout = Mango::Checkout->new({
        phase => 'CHECKOUT_PHASE_INITIALIZE'
    });
    $checkout->process;

=head1 DESCRIPTION

Mango::Checkout::Plugins::Initialize initializes order options.

=head1 METHODS

=head2 initialize

Nothing. Just a test of load order right now.

=head2 register

Registers the current plugin.

=head1 SEE ALSO

L<Handel::Checkout::Plugin>

=head1 AUTHOR

    Christopher H. Laco
    CPAN ID: CLACO
    claco@chrislaco.com
    http://today.icantfocus.com/blog/
