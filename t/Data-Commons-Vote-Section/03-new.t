use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Data::Commons::Vote::Competition;
use Data::Commons::Vote::Image;
use Data::Commons::Vote::Section;
use Data::Commons::Vote::Person;
use DateTime;
use Test::More 'tests' => 7;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);
my $c = Data::Commons::Vote::Competition->new(
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
	'jury_voting' => 0,
	'name' => 'Test competition',
	'public_voting' => 0,
);

# Test.
my $obj = Data::Commons::Vote::Section->new(
	'competition' => $c,
	'name' => 'Nature',
);
isa_ok($obj, 'Data::Commons::Vote::Section');

# Test.
my $uploader = Data::Commons::Vote::Person->new(
	'name' => 'Zuzana Zonova',
);
my $img = Data::Commons::Vote::Image->new(
	'commons_name' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
$obj = Data::Commons::Vote::Section->new(
	'competition' => $c,
	'images' => [$img],
	'logo' => 'Foo.jpg',
	'name' => 'Nature',
	'number_of_votes' => 3,
);
isa_ok($obj, 'Data::Commons::Vote::Section');

# Test.
eval {
	Data::Commons::Vote::Section->new(
		'competition' => $c,
	);
};
is($EVAL_ERROR, "Parameter 'name' is required.\n",
	"Parameter 'name' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Section->new(
		'competition' => $c,
		'name' => 'Nature',
		'images' => ['foo'],
	);
};
is($EVAL_ERROR, "Image isn't 'Data::Commons::Vote::Image' object.\n",
	"Image isn't 'Data::Commons::Vote::Image' object.");
clean();

# Test.
eval {
	Data::Commons::Vote::Section->new(
		'competition' => $c,
		'name' => 'Nature',
		'images' => [$img],
		'number_of_votes' => 'foo',
	);
};
is($EVAL_ERROR, "Parameter 'number_of_votes' must be a number.\n",
	"Parameter 'number_of_votes' must be a number.");
clean();

# Test.
eval {
	Data::Commons::Vote::Section->new(
		'name' => 'Nature',
	);
};
is($EVAL_ERROR, "Parameter 'competition' is required.\n",
	"Parameter 'competition' is required.");
clean();
