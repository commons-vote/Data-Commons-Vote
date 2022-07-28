use strict;
use warnings;

use Data::Commons::Vote::Person;
use DateTime;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Person->new;
is($obj->first_upload_at, undef, 'Get first upload at (undef - default).');

# Test.
$obj = Data::Commons::Vote::Person->new(
         'first_upload_at' => DateTime->new(
                 'day' => 18,
                 'month' => 7,
                 'year' => 2009,
                 'hour' => 21,
                 'minute' => 5,
         ),
);
is($obj->first_upload_at, '2009-07-18T21:05:00', 'Get first upload at (2009-07-18T21:05:00).');
isa_ok($obj->first_upload_at, 'DateTime');
