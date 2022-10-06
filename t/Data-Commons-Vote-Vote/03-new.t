use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::Image;
use Data::Commons::Vote::Person;
use Data::Commons::Vote::Vote;
use Data::Commons::Vote::VoteType;
use DateTime;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 6;
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
	'dt_from' => DateTime->new(
		'day' => 14,
		'month' => 7,
		'year' => 2009,
	),
	'dt_jury_voting_from' => DateTime->new(
		'day' => 27,
		'month' => 7,
		'year' => 2009,
	),
	'dt_jury_voting_to' => DateTime->new(
		'day' => 31,
		'month' => 7,
		'year' => 2009,
	),
	'dt_to' => DateTime->new(
		'day' => 26,
		'month' => 7,
		'year' => 2009,
	),
	'jury_voting' => 1,
	'name' => 'Example competition',
	'public_voting' => 0,
);
my $image = Data::Commons::Vote::Image->new(
	'commons_name' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
my $voter = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Jan Novák'),
);
my $vote_type = Data::Commons::Vote::VoteType->new(
	'created_by' => $creator,
	'type' => 'jury_marking',
);

# Test.
my $obj = Data::Commons::Vote::Vote->new(
	'competition' => $competition,
	'image' => $image,
	'person' => $voter,
	'vote_type' => $vote_type,
	'vote_value' => 1,
);
isa_ok($obj, 'Data::Commons::Vote::Vote');

# Test.
eval {
	Data::Commons::Vote::Vote->new(
		'image' => $image,
		'person' => $voter,
		'vote_type' => $vote_type,
		'vote_value' => 1,
	);
};
is($EVAL_ERROR, "Parameter 'competition' is required.\n",
	"Parameter 'competition' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Vote->new(
		'competition' => $competition,
		'person' => $voter,
		'vote_type' => $vote_type,
		'vote_value' => 1,
	);
};
is($EVAL_ERROR, "Parameter 'image' is required.\n",
	"Parameter 'image' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Vote->new(
		'competition' => $competition,
		'image' => $image,
		'vote_type' => $vote_type,
		'vote_value' => 1,
	);
};
is($EVAL_ERROR, "Parameter 'person' is required.\n",
	"Parameter 'person' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Vote->new(
		'competition' => $competition,
		'image' => $image,
		'person' => $voter,
		'vote_value' => 1,
	);
};
is($EVAL_ERROR, "Parameter 'vote_type' is required.\n",
	"Parameter 'vote_type' is required.");
clean();
