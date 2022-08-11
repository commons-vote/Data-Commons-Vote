use strict;
use warnings;

use Data::Commons::Vote::ValidationType;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::ValidationType->new(
	'type' => 'check_author_photos',
);
isa_ok($obj, 'Data::Commons::Vote::ValidationType');

# Test.
$obj = Data::Commons::Vote::ValidationType->new(
	'description' => 'Checks number of photos by author.',
	'id' => 1,
	'type' => 'check_author_photos',
);
isa_ok($obj, 'Data::Commons::Vote::ValidationType');

# Test.
eval {
	Data::Commons::Vote::ValidationType->new;
};
is($EVAL_ERROR, "Parameter 'type' is required.\n",
	"Parameter 'type' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::ValidationType->new(
		'type' => 'a' x 31,
	);
};
is($EVAL_ERROR, "Parameter 'type' has length greater than '30'.\n",
	"Parameter 'type' has length greater than '30'.");
clean();

# Test.
eval {
	Data::Commons::Vote::ValidationType->new(
		'id' => 'bad',
		'type' => 'check_author_photos',
	);
};
is($EVAL_ERROR, "Parameter 'id' must be a number.\n",
	"Parameter 'id' must be a number.");
clean();

# Test.
eval {
	Data::Commons::Vote::ValidationType->new(
		'description' => 'a' x 300,
		'type' => 'check_author_photos',
	);
};
is($EVAL_ERROR, "Parameter 'description' has length greater than '255'.\n",
	"Parameter 'description' has length greater than '255'.");
clean();
