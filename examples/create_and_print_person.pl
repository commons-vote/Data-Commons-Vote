#!/usr/bin/env perl

use strict;
use warnings;

use Data::Commons::Vote::Person;
use DateTime;
use Unicode::UTF8 qw(decode_utf8 encode_utf8);

my $obj = Data::Commons::Vote::Person->new(
        'first_upload_at' => DateTime->new(
                'day' => 18,
                'month' => 7,
                'year' => 2009,
                'hour' => 21,
                'minute' => 5,
        ),
        'id' => 1,
        'name' => decode_utf8('Michal Josef Špaček'),
        'wm_username' => 'Skim',
);

# Print out.
print 'Id: '.$obj->id."\n";
print 'Name: '.encode_utf8($obj->name)."\n";
print 'First upload to Wikimedia Commons: '.$obj->first_upload_at."\n";
print 'Wikimedia username: '.$obj->wm_username."\n";

# Output:
# Id: 1
# Name: Michal Josef Špaček
# First upload to Wikimedia Commons: 2009-07-18T21:05:00
# Wikimedia username: Skim