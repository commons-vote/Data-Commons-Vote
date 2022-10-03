use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::Person;
use Data::Commons::Vote::Section;
use DateTime;
use Test::More 'tests' => 2;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);
my $c = Data::Commons::Vote::Competition->new(
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
	'name' => 'Test competition',
	'public_voting' => 0,
);

# Test.
my $obj = Data::Commons::Vote::Section->new(
	'competition' => $c,
	'name' => 'Nature',
	'number_of_votes' => 3,
);
is($obj->number_of_votes, 3, 'Get number of votes.');
