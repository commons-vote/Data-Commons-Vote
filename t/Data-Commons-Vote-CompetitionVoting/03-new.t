use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::CompetitionVoting;
use Data::Commons::Vote::Person;
use Data::Commons::Vote::VotingType;
use DateTime;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 9;
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
	'voting_type' => $voting_type,
);
isa_ok($obj, 'Data::Commons::Vote::CompetitionVoting');

# Test.
$obj = Data::Commons::Vote::CompetitionVoting->new(
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
	'id' => 1,
	'number_of_votes' => 10,
	'voting_type' => $voting_type,
);
isa_ok($obj, 'Data::Commons::Vote::CompetitionVoting');

# Test.
eval {
	Data::Commons::Vote::CompetitionVoting->new(
		'competition' => $competition,
		'created_by' => $creator,
		'dt_to' => DateTime->new(
			'day' => 26,
			'month' => 7,
			'year' => 2009,
		),
		'voting_type' => $voting_type,
	);
};
is($EVAL_ERROR, "Parameter 'dt_from' is required.\n",
	"Parameter 'dt_from' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::CompetitionVoting->new(
		'competition' => $competition,
		'created_by' => $creator,
		'dt_from' => 'bad',
		'dt_to' => DateTime->new(
			'day' => 26,
			'month' => 7,
			'year' => 2009,
		),
		'voting_type' => $voting_type,
	);
};
is($EVAL_ERROR, "Parameter 'dt_from' must be a 'DateTime' object.\n",
	"Parameter 'dt_from' must be a 'DateTime' object.");
clean();

# Test.
eval {
	Data::Commons::Vote::CompetitionVoting->new(
		'competition' => $competition,
		'created_by' => $creator,
		'dt_from' => DateTime->new(
			'day' => 26,
			'month' => 7,
			'year' => 2009,
		),
		'voting_type' => $voting_type,
	);
};
is($EVAL_ERROR, "Parameter 'dt_to' is required.\n",
	"Parameter 'dt_to' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::CompetitionVoting->new(
		'competition' => $competition,
		'created_by' => $creator,
		'dt_from' => DateTime->new(
			'day' => 26,
			'month' => 7,
			'year' => 2009,
		),
		'dt_to' => 'bad',
		'voting_type' => $voting_type,
	);
};
is($EVAL_ERROR, "Parameter 'dt_to' must be a 'DateTime' object.\n",
	"Parameter 'dt_to' must be a 'DateTime' object.");
clean();

# Test.
eval {
	Data::Commons::Vote::CompetitionVoting->new(
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
		'id' => 'bad',
		'voting_type' => $voting_type,
	);
};
is($EVAL_ERROR, "Parameter 'id' must be a number.\n",
	"Parameter 'id' must be a number.");
clean();

# Test.
eval {
	Data::Commons::Vote::CompetitionVoting->new(
		'competition' => $competition,
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
		'voting_type' => $voting_type,
	);
};
is($EVAL_ERROR, "Parameter 'created_by' is required.\n",
	"Parameter 'created_by' is required.");
clean();
