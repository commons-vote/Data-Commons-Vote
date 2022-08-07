use strict;
use warnings;

use Data::Commons::Vote::Person;
use DateTime;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 7;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $obj = Data::Commons::Vote::Person->new;
isa_ok($obj, 'Data::Commons::Vote::Person');

# Test.
$obj = Data::Commons::Vote::Person->new(
	'first_upload_at' => DateTime->new(
		'day' => 18,
		'month' => 7,
		'year' => 2009,
		'hour' => 21,
		'minute' => 5,
	 ),
	'id' => 1,
	'name' => decode_utf8('Michal Josef Špaček'),
	'wm_username' => 'Skim',
);
isa_ok($obj, 'Data::Commons::Vote::Person');

# Test.
eval {
	Data::Commons::Vote::Person->new(
		'first_upload_at' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'first_upload_at' must be a 'DateTime' object.\n",
	"Parameter 'first_upload_at' must be a 'DateTime' object.");
clean();

# Test.
eval {
	Data::Commons::Vote::Person->new(
		'id' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'id' must be a number.\n",
	"Parameter 'id' must be a number.");
clean();

# Test.
eval {
	Data::Commons::Vote::Person->new(
		'name' => 'x' x 300,
	);
};
is($EVAL_ERROR, "Parameter 'name' has length greater than '255'.\n",
	"Parameter 'name' has length greater than '255'.");
clean();

# Test.
eval {
	Data::Commons::Vote::Person->new(
		'wm_username' => 'x' x 300,
	);
};
is($EVAL_ERROR, "Parameter 'wm_username' has length greater than '255'.\n",
	"Parameter 'wm_username' has length greater than '255'.");
clean();
