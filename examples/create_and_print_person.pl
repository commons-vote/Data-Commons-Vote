#!/usr/bin/env perl

use strict;
use warnings;

use Data::Commons::Vote::Person;
use Data::Commons::Vote::Role;
use DateTime;
use Unicode::UTF8 qw(decode_utf8 encode_utf8);

my $obj = Data::Commons::Vote::Person->new(
        'email' => 'skim@cpan.org',
        'first_upload_at' => DateTime->new(
                'day' => 18,
                'month' => 7,
                'year' => 2009,
                'hour' => 21,
                'minute' => 5,
        ),
        'id' => 1,
        'name' => decode_utf8('Michal Josef Špaček'),
        'roles' => [
                Data::Commons::Vote::Role->new(
                        'id' => 1,
                        'name' => 'admin',
                        'description' => 'Admin role.',
                ),
        ],
        'wm_username' => 'Skim',
);

# Print out.
print 'Id: '.$obj->id."\n";
print 'Name: '.encode_utf8($obj->name)."\n";
print 'Email: '.$obj->email."\n";
print 'First upload to Wikimedia Commons: '.$obj->first_upload_at."\n";
print 'Wikimedia username: '.$obj->wm_username."\n";
print "Roles:\n";
foreach my $role (@{$obj->roles}) {
        print "-\n";
        print '  Role id: '.$role->id."\n";
        print '  Role name: '.$role->name."\n";
        print '  Role description: '.$role->description."\n";
}

# Output:
# Id: 1
# Name: Michal Josef Špaček
# Email: skim@cpan.org
# First upload to Wikimedia Commons: 2009-07-18T21:05:00
# Wikimedia username: Skim
# Roles:
# -
#   Role id: 1
#   Role name: admin
#   Role description: Admin role.