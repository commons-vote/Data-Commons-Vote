use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::Person;
use Data::Commons::Vote::Section;
use DateTime;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);

# Test.
my $obj = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
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
is(scalar @{$obj->sections}, 0, 'Get sections number (0 - default).');

# Test.
$obj = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
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
	'sections' => [
		Data::Commons::Vote::Section->new(
			'name' => 'Nature',
		),
		Data::Commons::Vote::Section->new(
			'name' => 'People',
		),
	],
);
is(scalar @{$obj->sections}, 2, 'Get sections number (2).');
