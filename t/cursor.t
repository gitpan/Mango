use Mojo::Base -strict;

use Test::More;
use Mango;
use Mojo::IOLoop;

plan skip_all => 'set TEST_ONLINE to enable this test'
  unless $ENV{TEST_ONLINE};

# Add some documents to fetch
my $mango      = Mango->new($ENV{TEST_ONLINE});
my $collection = $mango->db->collection('cursor_test');
my $oids       = $collection->insert([{test => 3}, {test => 1}, {test => 2}]);
is scalar @$oids, 3, 'three documents inserted';

# Fetch documents blocking
my $cursor = $collection->find({})->limit(2);
my @docs;
ok !$cursor->id, 'no cursor id';
push @docs, $cursor->next;
ok $cursor->id, 'cursor has id';
push @docs, $cursor->next;
push @docs, $cursor->next;
ok !$cursor->next, 'no more documents';
@docs = sort { $a->{test} <=> $b->{test} } @docs;
is $docs[0]->{test}, 1, 'right document';
is $docs[1]->{test}, 2, 'right document';
is $docs[2]->{test}, 3, 'right document';

# Fetch all documents blocking
my $docs = $collection->find({})->limit(2)->all;
@$docs = sort { $a->{test} <=> $b->{test} } @$docs;
is $docs->[0]->{test}, 1, 'right document';
is $docs->[1]->{test}, 2, 'right document';
is $docs->[2]->{test}, 3, 'right document';

# Fetch documents non-blocking
$cursor = $collection->find({})->limit(2);
@docs   = ();
my $fail;
my $delay = Mojo::IOLoop->delay(
  sub {
    my $delay = shift;
    $cursor->next($delay->begin);
  },
  sub {
    my ($delay, $err, $doc) = @_;
    $fail = $err;
    push @docs, $doc;
    $cursor->next($delay->begin);
  },
  sub {
    my ($delay, $err, $doc) = @_;
    $fail ||= $err;
    push @docs, $doc;
    $cursor->next($delay->begin);
  },
  sub {
    my ($delay, $err, $doc) = @_;
    $fail ||= $err;
    push @docs, $doc;
  }
);
$delay->wait;
ok !$mango->is_active, 'no operations in progress';
ok !$fail, 'no error';
@docs = sort { $a->{test} <=> $b->{test} } @docs;
is $docs[0]->{test}, 1, 'right document';
is $docs[1]->{test}, 2, 'right document';
is $docs[2]->{test}, 3, 'right document';

# Fetch all documents non-blocking
@docs = ();
$collection->find({})->limit(2)->all(
  sub {
    my ($collection, $err, $docs) = @_;
    @docs = @$docs;
    Mojo::IOLoop->stop;
  }
);
Mojo::IOLoop->start;
ok !$mango->is_active, 'no operations in progress';
@docs = sort { $a->{test} <=> $b->{test} } @docs;
is $docs[0]->{test}, 1, 'right document';
is $docs[1]->{test}, 2, 'right document';
is $docs[2]->{test}, 3, 'right document';

# Fetch subset of documents sorted
$docs = $collection->find({})->fields({_id => 0})->sort({test => 1})->all;
is_deeply $docs, [{test => 1}, {test => 2}, {test => 3}], 'right subset';

# Rewind cursor blocking
$cursor = $collection->find({})->limit(2);
ok !$cursor->id, 'no cursor id';
$cursor->rewind;
my $doc = $cursor->next;
my $id  = $cursor->id;
ok $id,  'has cursor id';
ok $doc, 'found a document';
$cursor->rewind;
is_deeply $cursor->next, $doc, 'found same document again';
isnt $cursor->id,        $id,  'new cursor id';

# Rewind cursor non-blocking
$fail = $id = undef;
@docs = ();
$cursor = $collection->find({})->limit(2);
$delay  = Mojo::IOLoop->delay(
  sub {
    my $delay = shift;
    $cursor->next($delay->begin);
  },
  sub {
    my ($delay, $err, $doc) = @_;
    $fail = $err;
    $id   = $cursor->id;
    push @docs, $doc;
    $cursor->rewind($delay->begin);
  },
  sub {
    my $delay = shift;
    $cursor->next($delay->begin);
  },
  sub {
    my ($delay, $err, $doc) = @_;
    $fail ||= $err;
    push @docs, $doc;
  },
);
$delay->wait;
ok !$mango->is_active, 'no operations in progress';
ok !$fail, 'no error';
is_deeply $docs[0], $docs[1], 'found same document again';
isnt $cursor->id, $id, 'new cursor id';

# Remove all documents from collection
is $collection->remove->{n}, 3, 'three documents removed';

done_testing();
