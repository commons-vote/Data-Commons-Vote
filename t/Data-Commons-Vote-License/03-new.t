use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Data::Commons::Vote::License;
use Data::Commons::Vote::Person;
use DateTime;
use Test::More 'tests' => 11;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::License->new(
	'qid' => 'Q18199165',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
isa_ok($obj, 'Data::Commons::Vote::License');

# Test.
my $creator = Data::Commons::Vote::Person->new(
	'name' => 'Michal Josef Spacek',
);
$obj = Data::Commons::Vote::License->new(
	'created_at' => DateTime->now,
	'created_by' => $creator,
	'id' => 1,
	'qid' => 'Q18199165',
	'short_name' => 'CC BY-SA 4.0',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
isa_ok($obj, 'Data::Commons::Vote::License');

# Test.
eval {
	Data::Commons::Vote::License->new(
		'qid' => 'Q18199165',
	);
};
is($EVAL_ERROR, "Parameter 'text' is required.\n",
	"Parameter 'text' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::License->new(
		'qid' => 'x' x 40,
		'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
	);
};
is($EVAL_ERROR, "Parameter 'qid' has length greater than '30'.\n",
	"Parameter 'qid' has length greater than '30'.");
clean();

# Test.
eval {
	Data::Commons::Vote::License->new(
		'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
	);
};
is($EVAL_ERROR, "Parameter 'qid' is required.\n",
	"Parameter 'qid' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::License->new(
		'qid' => 'Q18199165',
		'text' => 'x' x 300,
	);
};
is($EVAL_ERROR, "Parameter 'text' has length greater than '255'.\n",
	"Parameter 'text' has length greater than '255'.");
clean();

# Test.
eval {
	Data::Commons::Vote::License->new(
		'created_at' => 'bad',
		'qid' => 'Q18199165',
		'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
	);
};
is($EVAL_ERROR, "Parameter 'created_at' must be a 'DateTime' object.\n",
	"Parameter 'created_at' must be a 'DateTime' object.");
clean();

# Test.
eval {
	Data::Commons::Vote::License->new(
		'created_by' => 'bad',
		'qid' => 'Q18199165',
		'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
	);
};
is($EVAL_ERROR, "Parameter 'created_by' must be a 'Data::Commons::Vote::Person' object.\n",
	"Parameter 'created_by' must be a 'Data::Commons::Vote::Person' object.");
clean();

# Test.
eval {
	Data::Commons::Vote::License->new(
		'id' => 'bad',
		'qid' => 'Q18199165',
		'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
	);
};
is($EVAL_ERROR, "Parameter 'id' must be a number.\n",
	"Parameter 'id' must be a number.");
clean();

# Test.
eval {
	Data::Commons::Vote::License->new(
		'qid' => 'Q18199165',
		'short_name' => 'x' x 60,
		'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
	);
};
is($EVAL_ERROR, "Parameter 'short_name' has length greater than '50'.\n",
	"Parameter 'short_name' has length greater than '50'.");
clean();
