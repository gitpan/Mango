# ABSTRACT: A proper ODM (Object-Document-Mapper) for MongoDB

use strict;
use warnings;

package Mango;
{
    $Mango::VERSION = '0.001_01';
}

use 5.001000;

our $VERSION = '0.001_01';    # VERSION

use Moose ('extends');

extends 'Mango::Application';


1;

__END__

=pod

=head1 NAME

Mango - A proper ODM (Object-Document-Mapper) for MongoDB 

=head1 VERSION

version 0.001_01

=head1 SYNOPSIS

... in CDDB.pm

    package CDDB;

    use Mango;
    
    app {
    
        # shared mongodb connection
        database => {
            name => 'mongodbi_cddb',
            host => 'mongodb://localhost:27017'
        },
    
        # load child doc classes
        classes => {
            self => 1, # loads CDDB::*
            load => ['Other::Namespace']
        }
    
    };
    
    1;

... in CDDB/Album.pm

    package CDDB::Album;
    
    use Mango::Document;
    
    # collection name
    store 'albums';
    
    # required fields
    key 'title',    is_str,  is_req;
    key 'released', is_date, is_req;
    
    # optional fields
    key 'rating', is_int, default => 1;
    
    # embedded documents
    embed 'tracks', class => 'CDDB::Track', type => 'multiple';
    
    # related artist document
    has_one 'band', class => 'CDDB::Artist';
    
    # stored query
    filter 'top_rated' => sub {
        
        my ($filter, $self, @args) = @_;
        
        $filter->where('rating$gte' => 5 )
        
    };
    
    1;

... and finally in your script.pl

    use DateTime;
    
    my $cddb = CDDB->new;
    
    my $cds  = $cddb->class('album'); # grabs CDDB::Album
    
    my $cd = $cds->new(
        title    => 'Just doin my job boss',
        released => DateTime->now
    );
    
    $cd->insert;
    
    # search using stored query (aka filter) and loop
    $cds->search('top_rated')->foreach_document(sub{    
        print shift->{title}, "\n"
    });

=head1 DESCRIPTION

Why MongoDB?
"MongoDB has the best features of document, key/value and relational
databases."

Mango is an Object-Document-Mapper (ODM) for L<MongoDB>. It allows you to
create L<Moose>-based classes to interact with MongoDB databases. Born out of
the frustration of waiting for someone else to create a proper MongoDB modeling
framework, I decided to bite-the-bullet and try my hand at it.

At-a-glance, most will enjoy Mango for its ability to easily model classes
while leveraging the power of MongoDB's schemaless and expeditious document-based
design, dynamic queries, and atomic modifier operations.

Also noteworthy is Mango's ease-of-use, chainable search facilities (filters),
automated indexing, moose-integration (inheritance support, etc), lean
document updates via dirty field tracking, and ability for each class to be
configured to use a different database and connection, etc.

This class, Mango, sub-classes L<Mango::Application>, please review that
module for more usage information.

=head1 AUTHORS

=over 4

=item *

Al Newkirk <awncorp@cpan.org>

=item *

Robert Grimes <buu@erxz.com>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by awncorp.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

