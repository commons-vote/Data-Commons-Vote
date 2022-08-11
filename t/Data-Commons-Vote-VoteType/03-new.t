use strict;
use warnings;

use Data::Commons::Vote::VoteType;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::VoteType->new(
	'type' => 'jury_marking',
);
isa_ok($obj, 'Data::Commons::Vote::VoteType');

# Test.
$obj = Data::Commons::Vote::VoteType->new(
	'description' => 'Voting type for jury marking.',
	'id' => 1,
	'type' => 'jury_marking',
);
isa_ok($obj, 'Data::Commons::Vote::VoteType');

# Test.
eval {
	Data::Commons::Vote::VoteType->new;
};
is($EVAL_ERROR, "Parameter 'type' is required.\n",
	"Parameter 'type' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::VoteType->new(
		'type' => 'a' x 31,
	);
};
is($EVAL_ERROR, "Parameter 'type' has length greater than '30'.\n",
	"Parameter 'type' has length greater than '30'.");
clean();

# Test.
eval {
	Data::Commons::Vote::VoteType->new(
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
		'description' => 'a' x 300,
		'type' => 'jury_marking',
	);
};
is($EVAL_ERROR, "Parameter 'description' has length greater than '255'.\n",
	"Parameter 'description' has length greater than '255'.");
clean();
