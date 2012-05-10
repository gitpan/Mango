# ABSTRACT: Defines and Represents a MongoDB Collection and Document

use strict;
use warnings;

package Mango::Document;
{
    $Mango::Document::VERSION = '0.001_01';
}

use 5.001000;

our $VERSION = '0.001_01';    # VERSION

use Moose ('extends');

extends 'Mango::Document::Base';


1;

__END__

=pod

=head1 NAME

Mango::Document - Defines and Represents a MongoDB Collection and Document

=head1 VERSION

version 0.001_01

=head1 SYNOPSIS

    package CDDB::Album;

    use Mango::Document;
    
    store 'albums';
    
    key 'title',    is_str,  is_req;
    key 'released', is_date, is_req;
    
    key 'rating', is_int, default => 1;
    
    has 'runtime', is_any; # will not be saved to the db
    
    embed 'tracks', class => 'CDDB::Track', type => 'multiple';
    
    has_one 'band', class => 'CDDB::Artist';
    
    1;

=head1 DESCRIPTION

Mango::Document is thee class used to model objects that will be persisted in
the MongoDB database. The representation of a Document in MongoDB is a BSON
object that is very similar to a Perl hash or JSON object. Documents can be
stored in their own collections in the database, or can be embedded in other
Documents -n- levels deep.

There is one important (and probably noticeable) difference in how Mango
approaches document modeling, as opposed to other MongoDB frameworks, which is
that a document class (a class that is modeled using Mango::Document) has
the same specifications whether its an embedded document, relational document or
a standard document.

This is because MongoDB doesn't make that distinction so I don't see why we
should be forced to. Instead, a document is a document with the only difference
being how it is implemented ... also meaning that a single document class can
be used in different contexts (relational document, embedded document, etc).

Mango::Document subclasses L<Mango::Document::Base>, see that class also
for additional information.

=head2 CONVENTIONS

It is important to take a moment to familiarize yourself with the conventions
Mango::Document uses, understanding these conventions will help you get
up-to-speed faster and allow you to wield all available functionality.

A Mango::Document has dual roles, the class role in which the class
represents a MongoDB collection, and an object role in which the object
represents a MongoDB document, as such there are methods that can be used on
the the class (e.g. search, create, find_or_create, etc) and methods that can
be used on the object (class instance) (e.g. save, update, remove, etc).

Mango::Document is NOT a wrapper around L<MongoDB::Collection>, although
there are some methods with the same name their operations are different.

The vast majority of Mango::Document method take hash key/value pairs as
opposed to hash-references, ... this convention can be a gotcha for some
developers so do remember.

Naming conventions are very important in a MongoDB database and Mango
document class. The following is merely an aid towards helping you name or
databases, collections, fields and indexes properly.

Databases should not be named "admin, local, or test". Collections and/or
Mango document class names should not be named "system".

More importantly, Fields should never be named using terms that may collide or
overwrite the functionality of existing Moose or Mango reserved words or
methods. Those terms include but are not limited to the following:

    package EggNoodle;
    
    use Mango::Document ; # +Moose
    
    key 'has' ;     # BAD
    key 'can' ;     # BAD
    key 'extends' ; # BAD
    
    # ... and other Moose keywords
    
    key 'id' ;      # BAD
    key 'name' ;    # BAD
    key 'key' ;     # BAD
    key 'store' ;   # BAD
    key 'change' ;  # BAD
    key 'config' ;  # BAD
    key 'file' ;    # BAD
    
    # ... and other Mango::Document::Sugar keywords
    
    index 'name' ;      # BAD
    index 'unique' ;    # BAD
    index 'drop_dups' ; # BAD
    index 'safe' ;      # BAD
    index 'background' ;# BAD
    
    # ... and other MongoDB indexing option keys
    
    1;

For now it is important for you to avoid using these names and others that
might collide with some inherited functionality. As a rule, simply name things
as specifically as possible. I apologize for any inconvenience. Please
familiarize yourself with L<Moose>'s keywords as well as the keywords found in
L<Mango::Document::Sugar>.

=head2 CONFIGURATION

Each Mango::Document can have a completely different configuration including
its database and host. It is not only possible, but easy as well, to have
different classes operating on different machines.

    package CDDB::Album;
    use Mango::Document;
    
    package main;
    
    my $config = CDDB::Album->config;
    $config->set_database(name => 'cddb');

=head2 DOCUMENT STORAGE

Mango::Document uses the store() declaration or the set_collection() config
method to set the name of the collection utilized by each class.
Read more on these methods in L<Mango::Document::Config>.

    # option A
    package CDDB::Album;
    use Mango::Document;
    
    store 'my_albums'; # collection name literally
    
    # option B
    package CDDB::Album;
    use Mango::Document;
    
    package main;
    CDDB::Album->config->set_collection(name => 'the_albums');

=head2 FIELD DECLARATIONS

Mango::Document exports L<Moose> making your class a Moose class (technically)
which means that Moose-base class declarations and rules apply however it is
important to note that Mango::Document exports its own sugary goodness for
defining document classes, more-to-the-point, Moose attributes declared with
the has() declaration will be ignored by Mango::Document mechanisms. For more
information on said sugary goodness, please review L<Mango::Document::Sugar>.

This blatant disregard is a feature, and allows us to have "protected" document
class fields that are used (e.g. by user-defined methods, etc) within our
application but never saved to the database.

When a class attribute needs to be declared as a database document key, the
key() declaration should be used. The key() declaration can be passed any
arguments which can be legally passed to Moose's has() method. Additionally,
L<Mango::Document::Sugar> exports a few relevant attribute argument
shorthands for your convenience such as (is_str, is_int, is_date, etc.).

Consider the follow simple class for modeling an album:

    package CDDB::Album;

    use Mango::Document;
    
    key 'title',    is_str,  is_req;
    key 'released', is_date, is_req;
    key 'rating',   is_int,  default => 1;
    
    has 'active',   is_str; # never saved to the db
    
    # is_str  == (is => 'rw', isa => 'Str')
    # is_int  == (is => 'rw', isa => 'Int')
    # is_date == (is => 'rw', isa => 'DateTime')
    
    # etc.
    
    1;

If you do not specify the type of field with the declaration, Mango::Document
will treat it as a String as that is the most commonly used field type.

Once instantiated, you can/will update the object attributes in the same way as
you would using a traditional Moose class.

PLEASE NOTE! There currently is NO mechanism in place to die or warn you if you
define a field on your document that conflicts with a reserved word, attribute
of method within the Mango core, ... so please use caution and common sense
naming. Although it may be pretty tempting to create a field on your class
named 'name' but I would advise against it, .. instead try fullname or similar.

For a complete list of keywords and declarations, please see the
L<Mango::Document::Sugar> documentation.

=head2 FIELD DIRTY TRACKING

Mango::Document supports the tracking of changed or "dirty" fields by placing
triggers on class attributes which denote whether the value has deviated from
its initial state.

If a defined field has been modified by it will be marked as dirty and
accessible as follows:

    use CDDB::Album;
    
    my $cd = CDDB::Album->new(title => 'LifeTime', released => DateTime->now);
    
    if ($cd->changed) {
        
        # okay, what changed?
        if ($cd->changed('title')) {
            
            print "You changed the title!";
            
        }
        
    }

=head2 CLASS INHERITANCE

Mango::Document, being a Moose class itself, supports inheritance much in
the exact same way as Moose in both root and embedded documents. In scenarios
where document classes are inherited from other document classes, their fields,
indexes, declarations, etc, get copied up the chain into derived class.

    {
        package CDDB::Person;
        
        use Mango::Document;
        
        key 'fullname', is_str, is_req, is_unique;
    }
    
    {
        package CDDB::Artist;
        
        use Mango::Document;
        
        extends 'CDDB::Person';
        
        store 'artists';
        
        key 'handle', is_str;
    }

=head2 STANDARD OPERATIONS, QUERYING, ETC

Mango::Document leverages the role L<Mango::Document::Storage::Operation>
to provide a standard range of common methods you would expect to find in any
other ORM, ODM, database framework.

    * CDDB::Album->count
    * CDDB::Album->create(...)
    * CDDB::Album->find(...)
    * CDDB::Album->find_one(...)
    * CDDB::Album->find_or_create(...)
    * CDDB::Album->find_or_new(...)
    * CDDB::Album->first
    * CDDB::Album->last
    * CDDB::Album->new(...)->save
    * CDDB::Album->create(...)->remove
    * CDDB::Album->create(...)->update
    * CDDB::Album->search
    
    ... etc

One of Mango's greatest features is its querying abstraction layer handled by
L<Mango::Document::Storage::Criterion>, please review that documentation for
an in-depth look at Mango's querying facilities. Most all queries in Mango
are wrapped around a L<Mango::Document::Storage::Criterion> object, which is
a chainable object for building complex and dynamic queries. The querying
object will never hit the database until you tell it to.

The following is an example of how Mango's querying abstraction facilities
can be used:

    * CDDB::Album->search->all_in(...)
    * CDDB::Album->search->all_of(...)
    * CDDB::Album->search->also_in(...)
    * CDDB::Album->search->any_in(...)
    * CDDB::Album->search->any_of(...)
    * CDDB::Album->search->asc_sort(...)
    * CDDB::Album->search->desc_sort(...)
    * CDDB::Album->search->select(...)
    
    ... etc
    
    my $search = CDDB::Album->search;
       $search = $search->where('released$lt' => DateTime->now->set(...));
       $search = $search->asc_sort('title')->limit(25);
       
    my $mongodb_cursor = $search->query;

While we're on the topic of serious querying, Mango::Document also allows you
to define "chains" on your classes as a convenience for generating complex
query strings. Chains (chainable search objects) are declared on
Mango::Document classes using the chain() declaration. All class chains are
chainable and might look as follows:

    package CDDB::Artist;
    
    use Mango::Document;
    
    extends 'CDDB::Person';
    
    store 'artists';
    
    key 'handle', is_str;
    
    chain 'is_legal' => sub { shift->and_where('age$gt' => 21) }
    chain 'is_local' => sub { shift->and_where('state$in' => ['PA', 'NJ']) }
    
    package main;
    
    my $artists = CDDB::Artist;
    
    my $mongodb_cursor = $artists->is_legal->is_local->query; 

=head2 DOCUMENT CLASS RELATIONSHIPS

As previously stated, with Mango::Document classes, the only difference
between embedded, relational and standard documents are how they're declared to
be applied to the database. All types of documents are designed as
Mango::Document classes. Declaring a document class to be applied to the
database as an embedded or relational document simply means declaring a
relationship between two document classes. The declarations used to declare such
relationships are embed(), has_one(), and has_many(). These declarations are
exported by and explained in further detail in the L<Mango::Document::Sugar>
documentation.

Document class relationships are associations between one document and another.
The embedded document relationship describes a child document(s) stored within a
parent document. The relational (referenced) document relationship describes
a document(s) referenced by separate document in separate collection.

Mango::Document classes declared to be related to other document classes are
wrapped by object-based proxies for the actual document class which provides
functionality for accessing, replacing, appending and persisting.

Consider the following example which declares both an embedded and relational
relationship:

    package CDDB::Album;

    use Mango::Document;
    
    ...
    
    embed 'producer', class => 'CDDB::Person';
    embed 'tracks', class => 'CDDB::Track', type => 'multiple';
    
    has_one 'band', class => 'CDDB::Artist';
    has_many 'compilations', class => 'CDDB::Album';
    
    package main;
    
    my $albums = CDDB::Album;
    my $album  = $albums->new(...);
    
    $album->producer->add(name => 'Mike Nice');
    $album->tracks->add(title => 'Rainbow Bum');
    $album->tracks->add(title => 'Silver Gazelle');
    
    $album->band->add(name => 'Randy Watson', handle => 'Sexual Chocolate');
    
    $album->save;

For a more in-depth look at relationships, please review the documentation for
L<Mango::Document::Child> and L<Mango::Document::Relative>.

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

