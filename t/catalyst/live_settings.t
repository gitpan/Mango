#!perl -w
# $Id: /local/CPAN/Mango/t/catalyst/live_settings.t 1578 2008-05-10T01:30:21.225794Z claco  $
use strict;
use warnings;

use lib 't/lib';
use Mango::Tests::Catalyst::Settings;
Mango::Tests::Catalyst::Settings->runtests;
