use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::Person;
use DateTime;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 7;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);

# Test.
my $obj = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
	'name' => 'Example competition',
);
isa_ok($obj, 'Data::Commons::Vote::Competition');

# Test.
$obj = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
	'id' => 1,
	'name' => 'Example competition',
);
isa_ok($obj, 'Data::Commons::Vote::Competition');

# Test.
eval {
	Data::Commons::Vote::Competition->new(
		'created_by' => $creator,
		'id' => 'bad',
		'name' => 'Example competition',
	);
};
is($EVAL_ERROR, "Parameter 'id' must be a number.\n",
	"Parameter 'id' must be a number.");
clean();

# Test.
eval {
	Data::Commons::Vote::Competition->new(
		'created_by' => $creator,
	);
};
is($EVAL_ERROR, "Parameter 'name' is required.\n",
	"Parameter 'name' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Competition->new(
		'created_by' => $creator,
		'name' => 'x' x 300,
	);
};
is($EVAL_ERROR, "Parameter 'name' has length greater than '255'.\n",
	"Parameter 'name' has length greater than '255'.");
clean();

# Test.
eval {
	Data::Commons::Vote::Competition->new(
		'name' => 'Example competition',
	);
};
is($EVAL_ERROR, "Parameter 'created_by' is required.\n",
	"Parameter 'created_by' is required.");
clean();
