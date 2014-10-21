package Mango::Cursor;
use Mojo::Base -base;

has [qw(collection id sort)];
has limit => 10;
has [qw(fields query)] => sub { {} };
has skip => 0;

sub all {
  my ($self, $cb) = @_;

  # Non-blocking
  my @all;
  return $self->next(sub { shift->_collect(\@all, $cb, @_) }) if $cb;

  # Blocking
  while (my $next = $self->next) { push @all, $next }
  return \@all;
}

sub next {
  my ($self, $cb) = @_;
  return exists $self->{results} ? $self->_continue($cb) : $self->_start($cb);
}

sub rewind {
  my ($self, $cb) = @_;

  return unless my $id = $self->id;
  delete $self->id(undef)->{results};

  # Non-blocking
  return $self->collection->db->mango->kill_cursors($id => sub { $self->$cb })
    if $cb;

  # Blocking
  $self->collection->db->mango->kill_cursors($id);
}

sub _collect {
  my ($self, $all, $cb, $err, $doc) = @_;
  return $self->$cb($err, $all) if $err || !$doc;
  push @$all, $doc;
  $self->next(sub { shift->_collect($all, $cb, @_) });
}

sub _continue {
  my ($self, $cb) = @_;

  # Non-blocking
  my $collection = $self->collection;
  my $name       = $collection->full_name;
  if ($cb) {
    return $self->$cb(undef, shift @{$self->{results}}) if @{$self->{results}};
    return $collection->db->mango->get_more(
      ($name, $self->limit, $self->id) => sub {
        my ($mango, $err, $reply) = @_;
        $self->$cb($err, $self->_queue($reply));
      }
    );
  }

  # Blocking
  return shift @{$self->{results}} if @{$self->{results}};
  return $self->_queue(
    $collection->db->mango->get_more($name, $self->limit, $self->id));
}

sub _query {
  my $self  = shift;
  my $query = $self->query;
  return $query unless my $sort = $self->sort;
  return {'$query' => $query, '$orderby' => $sort};
}

sub _queue {
  my ($self, $reply) = @_;
  push @{$self->{results} ||= []}, @{$reply->[5]};
  return shift @{$self->{results}};
}

sub _start {
  my ($self, $cb) = @_;

  my $collection = $self->collection;
  my $name       = $collection->full_name;
  my @args
    = ($name, {}, $self->skip, $self->limit, $self->_query, $self->fields);

  # Non-blocking
  return $collection->db->mango->query(
    @args => sub {
      my ($mango, $err, $reply) = @_;
      $self->id($reply->[3]);
      $self->$cb($err, $self->_queue($reply));
    }
  ) if $cb;

  # Blocking
  my $reply = $collection->db->mango->query(@args);
  $self->id($reply->[3]);
  return $self->_queue($reply);
}

1;

=head1 NAME

Mango::Cursor - MongoDB cursor

=head1 SYNOPSIS

  use Mango::Cursor;

  my $cursor = Mango::Cursor->new(collection => $collection);

=head1 DESCRIPTION

L<Mango::Cursor> is a container for MongoDB cursors used by
L<Mango::Collection>.

=head1 ATTRIBUTES

L<Mango::Cursor> implements the following attributes.

=head2 collection

  my $collection = $cursor->collection;
  $cursor        = $cursor->collection(Mango::Collection->new);

L<Mango::Collection> object this cursor belongs to.

=head2 id

  my $id  = $cursor->id;
  $cursor = $cursor->id(123456);

Cursor id.

=head2 limit

  my $limit = $cursor->limit;
  $cursor   = $cursor->limit(1);

Limit, defaults to C<10>.

=head2 fields

  my $fields = $cursor->fields;
  $cursor    = $cursor->fields({foo => 1});

Fields.

=head2 query

  my $query = $cursor->query;
  $cursor   = $cursor->query({foo => 'bar'});

Query.

=head2 skip

  my $skip = $cursor->skip;
  $cursor  = $cursor->skip(5);

Documents to skip, defaults to C<0>.

=head2 sort

  my $sort = $cursor->sort;
  $cursor  = $cursor->sort({foo => 1});

Sort.

=head1 METHODS

L<Mango::Cursor> inherits all methods from L<Mojo::Base> and implements the
following new ones.

=head2 all

  my $docs = $cursor->all;

Fetch all documents. You can also append a callback to perform operation
non-blocking.

  $cursor->all(sub {
    my ($cursor, $err, $docs) = @_;
    ...
  });
  Mojo::IOLoop->start unless Mojo::IOLoop->is_running;

=head2 next

  my $doc  = $cursor->next;

Fetch next document. You can also append a callback to perform operation
non-blocking.

  $cursor->next(sub {
    my ($cursor, $err, $doc) = @_;
    ...
  });
  Mojo::IOLoop->start unless Mojo::IOLoop->is_running;

=head2 rewind

  $cursor->rewind;

Rewind cursor. You can also append a callback to perform operation
non-blocking.

  $cursor->rewind(sub {
    my $cursor = shift;
    ...
  });
  Mojo::IOLoop->start unless Mojo::IOLoop->is_running;

=head1 SEE ALSO

L<Mango>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
