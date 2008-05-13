#!/usr/bin/perl -w
use strict;
use warnings;
use File::Find;

find( { wanted => \&wanted, follow => 1, no_chdir => 1 }, '.' );

sub wanted {
    system 'svk', 'propset', 'svn:keywords', 'Id', $File::Find::name;
    #print system 'svk', 'propget', 'svn:keywords', $File::Find::name;
}
