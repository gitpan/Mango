#!perl -w
# $Id: /local/CPAN/Mango/t/catalyst/live_wishlists_path.t 1644 2008-06-02T01:46:53.055259Z claco  $
use strict;
use warnings;

use lib 't/lib';
use Mango::Tests::Catalyst::Wishlists::Path;
Mango::Tests::Catalyst::Wishlists::Path->runtests;
