#!perl -wT
# $Id: /local/Mango/trunk/t/catalyst/controller_rest.t 284 2007-05-22T15:13:46.674563Z CLaco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Mango::Test tests => 15;
    use Mango::Test::Catalyst;

    use_ok('Mango::Catalyst::Controller::REST');
    use_ok('Mango::Exception', ':try');
};


## check request content type setting
{
    my $c = Mango::Test::Catalyst->new;
    my $controller = $c->controller('REST');
    isa_ok($controller, 'Mango::Catalyst::Controller::REST');

    $controller->begin($c);
    is($c->request->content_type, 'text/html');

    $c->request->{'view'} = 'json';
    $controller->begin($c);
    is($c->request->content_type, 'text/x-json');

    $c->request->{'view'} = 'yml';
    $controller->begin($c);
    is($c->request->content_type, 'text/x-yaml');

    $c->request->{'view'} = 'atom';
    $controller->begin($c);
    is($c->request->content_type, 'application/atom+xml');

    $c->request->{'view'} = 'yaml';
    $controller->begin($c);
    is($c->request->content_type, 'text/x-yaml');

    $c->request->{'view'} = 'txt';
    $controller->begin($c);
    is($c->request->content_type, 'text/plain');

    $c->request->{'view'} = 'rss';
    $controller->begin($c);
    is($c->request->content_type, 'application/rss+xml');

    $c->request->{'view'} = 'text';
    $controller->begin($c);
    is($c->request->content_type, 'text/plain');

    $c->request->{'view'} = 'htm';
    $controller->begin($c);
    is($c->request->content_type, 'text/html');

    $c->request->{'view'} = 'xhtml';
    $controller->begin($c);
    is($c->request->content_type, 'application/xhtml+xml');

    $c->request->{'view'} = 'html';
    $controller->begin($c);
    is($c->request->content_type, 'text/html');

    $c->request->content_type('application/x-storable');
    $c->request->{'view'} = 'crapiseatenintoundef';
    $controller->begin($c);
    is($c->request->content_type, undef);
};