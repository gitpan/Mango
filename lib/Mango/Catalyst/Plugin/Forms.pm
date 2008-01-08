# $Id: /local/CPAN/Mango/lib/Mango/Catalyst/Plugin/Forms.pm 1126 2008-01-03T22:52:40.007904Z claco  $
package Mango::Catalyst::Plugin::Forms;
use strict;
use warnings;
our $VERSION = $Mango::VERSION;

BEGIN {
    use base qw/Class::Accessor::Grouped/;
    use Mango ();
    use Scalar::Util qw/blessed/;

    __PACKAGE__->mk_group_accessors('inherited', qw/_forms/);
};
__PACKAGE__->_forms({});

sub add_form {
    my ($self, $form, $name) = @_;

    if (blessed $form && $form->isa('Mango::Form')) {
        $name ||= $form->id || $form->name;
        $self->_forms->{$name} = $form;
    } else {
        Mango::Exception->throw('NOT_A_FORM');
    };

    return;
};

sub forms {
    my ($self, $name) = @_;

    if (my $form = $self->_forms->{$name}) {
        $form = $form->clone;

        ## hack around form action // under Cat::Test/Mech
        if ($form->{'action'} || $form->action =~ /^\/\//) {
            $form->action($self->request->uri->as_string);
        };
        $form->params($self->request);
        $form->localizer(
            sub {$self->localize(@_)}
        );    

        return $form;
    };

    return;
};

1;
__END__
