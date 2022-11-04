use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::CompetitionVoting;
use Data::Commons::Vote::Image;
use Data::Commons::Vote::Person;
use Data::Commons::Vote::Vote;
use Data::Commons::Vote::VotingType;
use DateTime;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);
my $uploader = Data::Commons::Vote::Person->new(
	'name' => 'Zuzana Zonova',
);
my $competition = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
	'name' => 'Example competition',
);
my $image = Data::Commons::Vote::Image->new(
	'commons_name' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
my $voting_type = Data::Commons::Vote::VotingType->new(
	'created_by' => $creator,
	'type' => 'jury_marking',
);
my $competition_voting = Data::Commons::Vote::CompetitionVoting->new(
	'competition' => $competition,
	'created_by' => $creator,
	'dt_from' => DateTime->new(
		'day' => 14,
		'month' => 7,
		'year' => 2022,
	),
	'dt_to' => DateTime->new(
		'day' => 31,
		'month' => 12,
		'year' => 2022,
	),
	'voting_type' => $voting_type,
);
my $voter = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Jan Novák'),
);

# Test.
my $obj = Data::Commons::Vote::Vote->new(
	'competition_voting' => $competition_voting,
	'image' => $image,
	'person' => $voter,
	'vote_value' => 1,
);
isa_ok($obj, 'Data::Commons::Vote::Vote');

# Test.
eval {
	Data::Commons::Vote::Vote->new(
		'image' => $image,
		'person' => $voter,
		'vote_value' => 1,
	);
};
is($EVAL_ERROR, "Parameter 'competition_voting' is required.\n",
	"Parameter 'competition_voting' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Vote->new(
		'competition_voting' => $competition_voting,
		'person' => $voter,
		'vote_value' => 1,
	);
};
is($EVAL_ERROR, "Parameter 'image' is required.\n",
	"Parameter 'image' is required.");
clean();
