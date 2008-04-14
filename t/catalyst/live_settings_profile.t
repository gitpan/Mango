#!perl -w
# $Id: /local/CPAN/Mango/t/catalyst/live_settings_profile.t 1528 2008-04-14T01:08:40.114508Z claco  $
use strict;
use warnings;

BEGIN {
    use lib 't/lib';
    use Mango::Test tests => 30;

    Mango::Test->mk_app;
};


{
    my $m = Test::WWW::Mechanize::Catalyst->new;


    ## not logged in
    $m->get_ok('http://localhost/');
    $m->follow_link_ok({text => 'Login'});
    $m->title_like(qr/login/i);
    $m->content_unlike(qr/already logged in/i);
    $m->content_unlike(qr/welcome anonymous/i);
    ok(! $m->find_link(text => 'Logout'));
    ok(! $m->find_link(text => 'Profile'));

    ## login
    $m->submit_form_ok({
        form_name => 'login',
        fields    => {
            username => 'admin',
            password => 'admin'
        }
    });
    $m->title_like(qr/login/i);
    $m->content_like(qr/login successful/i);
    $m->content_like(qr/welcome admin/i);
    ok(! $m->find_link(text => 'Login'));
    ok($m->find_link(text => 'Logout'));


    ## edit profile
    $m->follow_link_ok({text => 'Profile'});
    $m->title_like(qr/profile/i);
    $m->submit_form_ok({
        form_name => 'settings_profile',
        fields    => {
            password => 'admin',
            confirm_password => 'admin',
            first_name => 'Administration',
            last_name => 'User'
        }
    });
    $m->title_like(qr/profile/i);
    $m->content_like(qr/welcome administration/i);


    ## logout
    $m->follow_link_ok({text => 'Logout'});
    $m->content_like(qr/logout successful/i);
    $m->content_unlike(qr/welcome administration/i);
    ok($m->find_link(text => 'Login'));
    ok(! $m->find_link(text => 'Logout'));

    ## login again
    $m->follow_link_ok({text => 'Login'});
    $m->submit_form_ok({
        form_name => 'login',
        fields    => {
            username => 'admin',
            password => 'admin'
        }
    });
    $m->title_like(qr/login/i);
    $m->content_like(qr/login successful/i);
    $m->content_like(qr/welcome administration/i);
    ok(! $m->find_link(text => 'Login'));
    ok($m->find_link(text => 'Logout'));
};