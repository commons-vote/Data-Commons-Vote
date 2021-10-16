use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Data::Commons::Vote::Image;
use Data::Commons::Vote::Section;
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Test.
my $img = Data::Commons::Vote::Image->new(
	'image' => 'Michal from Czechia.jpg',
);
my $obj = Data::Commons::Vote::Section->new(
	'images' => [$img],
	'name' => 'Nature',
);
isa_ok($obj, 'Data::Commons::Vote::Section');

# Test.
$obj = Data::Commons::Vote::Section->new(
	'images' => [$img],
	'logo' => 'Foo.jpg',
	'name' => 'Nature',
	'number_of_votes' => 3,
);
isa_ok($obj, 'Data::Commons::Vote::Section');

# Test.
eval {
	Data::Commons::Vote::Section->new;
};
is($EVAL_ERROR, "Parameter 'name' is required.\n",
	"Parameter 'name' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Section->new(
		'name' => 'Nature',
	);
};
is($EVAL_ERROR, "Parameter 'images' is required.\n",
	"Parameter 'images' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Section->new(
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
		'name' => 'Nature',
		'images' => [$img],
		'number_of_votes' => 'foo',
	);
};
is($EVAL_ERROR, "Parameter 'number_of_votes' must be a number.\n",
	"Parameter 'number_of_votes' must be a number.");
clean();
