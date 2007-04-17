# $Id: /local/Mango/trunk/lib/Mango/Schema.pm 150 2007-04-14T02:57:04.324056Z claco  $
package Mango::Schema;
use strict;
use warnings;

BEGIN {
    use base qw/DBIx::Class::Schema/;
};
__PACKAGE__->load_classes;

1;
__END__

=head1 NAME

Mango::Schema - Schema class for Mango

=head1 SYNOPSIS

    use Mango::Schema;
    my $schema = Mango::Schema->connect;
    my $roles = $schema->resultset('Roles')->search;

=head1 DESCRIPTION

Mango::Schema is the schema classes used to interact with the database.

=head1 AUTHOR

    Christopher H. Laco
    CPAN ID: CLACO
    claco@chrislaco.com
    http://today.icantfocus.com/blog/
