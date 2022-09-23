use strict;
use warnings;

use Data::Commons::Vote::Person;
use Data::Commons::Vote::VoteType;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 8;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);

# Test.
my $obj = Data::Commons::Vote::VoteType->new(
	'created_by' => $creator,
	'type' => 'jury_marking',
);
isa_ok($obj, 'Data::Commons::Vote::VoteType');

# Test.
$obj = Data::Commons::Vote::VoteType->new(
	'created_by' => $creator,
	'description' => 'Voting type for jury marking.',
	'id' => 1,
	'type' => 'jury_marking',
);
isa_ok($obj, 'Data::Commons::Vote::VoteType');

# Test.
eval {
	Data::Commons::Vote::VoteType->new(
		'created_by' => $creator,
	);
};
is($EVAL_ERROR, "Parameter 'type' is required.\n",
	"Parameter 'type' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::VoteType->new(
		'created_by' => $creator,
		'type' => 'a' x 31,
	);
};
is($EVAL_ERROR, "Parameter 'type' has length greater than '30'.\n",
	"Parameter 'type' has length greater than '30'.");
clean();

# Test.
eval {
	Data::Commons::Vote::VoteType->new(
		'created_by' => $creator,
		'id' => 'bad',
		'type' => 'jury_marking',
	);
};
is($EVAL_ERROR, "Parameter 'id' must be a number.\n",
	"Parameter 'id' must be a number.");
clean();

# Test.
eval {
	Data::Commons::Vote::VoteType->new(
		'created_by' => $creator,
		'description' => 'a' x 300,
		'type' => 'jury_marking',
	);
};
is($EVAL_ERROR, "Parameter 'description' has length greater than '255'.\n",
	"Parameter 'description' has length greater than '255'.");
clean();

# Test.
eval {
	Data::Commons::Vote::VoteType->new(
		'type' => 'jury_marking',
	);
};
is($EVAL_ERROR, "Parameter 'created_by' is required.\n",
	"Parameter 'created_by' is required.");
clean();
