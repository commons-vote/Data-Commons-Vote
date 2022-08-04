use strict;
use warnings;

use Data::Commons::Vote::Competition;
use DateTime;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 10;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Competition->new(
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
isa_ok($obj, 'Data::Commons::Vote::Competition');

# Test.
$obj = Data::Commons::Vote::Competition->new(
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
	'jury_voting' => 1,
	'name' => 'Example competition',
	'number_of_votes' => 10,
	'public_voting' => 1,
);
isa_ok($obj, 'Data::Commons::Vote::Competition');

# Test.
eval {
	Data::Commons::Vote::Competition->new(
		'dt_to' => DateTime->new(
			 'day' => 26,
			 'month' => 7,
			 'year' => 2009,
		),
		'name' => 'Example competition',
		'public_voting' => 0,
	);
};
is($EVAL_ERROR, "Parameter 'dt_from' is required.\n",
	"Parameter 'dt_from' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Competition->new(
		'dt_from' => 'bad',
		'dt_to' => DateTime->new(
			 'day' => 26,
			 'month' => 7,
			 'year' => 2009,
		),
		'jury_voting' => 0,
		'name' => 'Example competition',
		'public_voting' => 0,
	);
};
is($EVAL_ERROR, "Parameter 'dt_from' must be a 'DateTime' object.\n",
	"Parameter 'dt_from' must be a 'DateTime' object.");
clean();

# Test.
eval {
	Data::Commons::Vote::Competition->new(
		'dt_from' => DateTime->new(
			 'day' => 26,
			 'month' => 7,
			 'year' => 2009,
		),
		'jury_voting' => 0,
		'name' => 'Example competition',
		'public_voting' => 0,
	);
};
is($EVAL_ERROR, "Parameter 'dt_to' is required.\n",
	"Parameter 'dt_to' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Competition->new(
		'dt_from' => DateTime->new(
			 'day' => 26,
			 'month' => 7,
			 'year' => 2009,
		),
		'dt_to' => 'bad',
		'jury_voting' => 0,
		'name' => 'Example competition',
		'public_voting' => 0,
	);
};
is($EVAL_ERROR, "Parameter 'dt_to' must be a 'DateTime' object.\n",
	"Parameter 'dt_to' must be a 'DateTime' object.");
clean();

# Test.
eval {
	Data::Commons::Vote::Competition->new(
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
		'jury_voting' => 0,
		'name' => 'Example competition',
		'public_voting' => 0,
	);
};
is($EVAL_ERROR, "Parameter 'id' must be a number.\n",
	"Parameter 'id' must be a number.");
clean();

# Test.
eval {
	Data::Commons::Vote::Competition->new(
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
		'public_voting' => 0,
	);
};
is($EVAL_ERROR, "Parameter 'name' is required.\n",
	"Parameter 'name' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Competition->new(
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
		'name' => 'x' x 300,
		'public_voting' => 0,
	);
};
is($EVAL_ERROR, "Parameter 'name' has length greater than '255'.\n",
	"Parameter 'name' has length greater than '255'.");
clean();
