package Mango::Catalyst::Controller::Products;
use strict;
use warnings;

BEGIN {
    use base qw/Mango::Catalyst::Controller/;
    use Mango ();
    use HTML::TagCloud::Sortable ();
    use Path::Class::Dir ();

    __PACKAGE__->config(
        resource_name  => 'mango/products',
        form_directory => Path::Class::Dir->new(Mango->share, 'forms', 'products')
    );
};

sub list : Chained('/') PathPrefix Args(0) Template('products/list') {
    my ($self, $c) = @_;
    my $tags = $c->model('Products')->tags({}, {
        order_by => 'tag.name'
    });
    $c->stash->{'tags'} = $tags;

    my $tagcloud = HTML::TagCloud::Sortable->new;
    foreach my $tag ($tags->all) {
        $tagcloud->add({
            name => $tag->name,
            count => $tag->count,
            url => $c->uri_for('tags', $tag->name) . '/'
        });
    };
    $c->stash->{'tagcloud'} = $tagcloud;

    return;
};

sub instance : Chained('/') PathPrefix CaptureArgs(1) {
    my ($self, $c, $sku) = @_;
    my $product = $c->model('Products')->get_by_sku($sku);

    if (defined $product) {
        $c->stash->{'product'} = $product;
    } else {
        $c->response->status(404);
        $c->detach;
    };
};

sub view : Chained('instance') PathPart('') Args(0) Template('products/view') {
    my ($self, $c) = @_;

};

sub tags : Local Template('products/list') {
    my ($self, $c, @tags) = @_;

    return unless scalar @tags;

    my $products = $c->model('Products')->search({
        tags => \@tags
    }, {
        page => $self->current_page,
        rows => $self->entries_per_page
    });
    my $pager = $products->pager;
    $c->stash->{'products'} = $products;
    $c->stash->{'pager'} = $pager;


    my $tags = $c->model('Products')->related_tags({
        tags => \@tags
    }, {
        order_by => 'tag.name'
    });
    $c->stash->{'tags'} = $tags;

    my $tagcloud = HTML::TagCloud::Sortable->new;
    foreach my $tag ($tags->all) {
        $tagcloud->add({
            name => $tag->name,
            count => $tag->count,
            url => $c->uri_for('tags', @tags, $tag->name) . '/'
        });
    };
    $c->stash->{'tagcloud'} = $tagcloud;

    return;
};

1;
__END__

=head1 NAME

Mango::Catalyst::Controller::Products - Catalyst controller for displaying
products.

=head1 DESCRIPTION

Mango::Catalyst::Controller::products provides the web interface for
displaying products.

=head1 ACTIONS

=head2 index : /

Displays the main product page.

=head1 AUTHOR

    Christopher H. Laco
    CPAN ID: CLACO
    claco@chrislaco.com
    http://today.icantfocus.com/blog/
