use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::CompetitionVoting;
use Data::Commons::Vote::Person;
use Data::Commons::Vote::VotingType;
use DateTime;
use Test::More 'tests' => 2;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);
my $competition = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
	'name' => 'Example competition',
);
my $voting_type = Data::Commons::Vote::VotingType->new(
	'created_by' => $creator,
	'description' => 'Anonymous voting.',
	'type' => 'anonymous_voting',
);

# Test.
my $obj = Data::Commons::Vote::CompetitionVoting->new(
	'competition' => $competition,
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
	'name' => 'Example competition',
	'voting_type' => $voting_type,
);
is($obj->created_by->name, decode_utf8('Michal Josef Špaček'), 'Get created_by (Michal Josef Špaček).');
