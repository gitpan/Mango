#!perl -w
# $Id: /local/Mango/trunk/t/catalyst/view_xhtml.t 309 2007-05-29T15:19:54.893692Z claco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Mango::Test;
    use Mango::Test::Catalyst;

    eval 'require Directory::Scratch';
    if($@) {
        plan skip_all => 'Directory::Scratch not installed';
    } else {
        plan tests => 5;
    };

    use_ok('Mango::Catalyst::View::XHTML');
};

my $temp = Directory::Scratch->new;
my $dir  = $temp->mkdir('templates/tt/xhtml');
my $file = $temp->touch('templates/tt/xhtml/default', 'foo');
$temp->touch('templates/tt/xhtml/wrapper', '[% content %]');
$ENV{'MANGO_SHARE'} = $temp;

my $c = Mango::Test::Catalyst->new({
    config => {
        root => 't',
        home => 't'
    },
    stash => {
        template => $file->basename
    }
});
my $view = $c->view('XHTML');
isa_ok($view, 'Mango::Catalyst::View::XHTML');


## check the content type header
{
    ok($view->process($c));
    is($c->response->content_type, 'application/xhtml+xml; charset=utf-8');

    SKIP: {
        skip 'Test::LongString not installed', 1 unless eval 'require Test::LongString';

        Test::LongString::is_string_nows($c->response->body, 'foo');
    };
};
