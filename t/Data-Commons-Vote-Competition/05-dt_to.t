use strict;
use warnings;

use Data::Commons::Vote::Competition;
use DateTime;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Competition->new(
	'dt_from' => DateTime->new(
                 'day' => 14,
                 'month' => 7,
                 'year' => 2009,
	),
	'dt_to' => DateTime->new(
                 'day' => 26,
                 'month' => 7,
                 'year' => 2009,
	),
	'jury_voting' => 0,
	'name' => 'Example competition',
	'public_voting' => 0,
);
is($obj->dt_to, '2009-07-26T00:00:00', 'Get date to (2009-07-26T00:00:00).');
