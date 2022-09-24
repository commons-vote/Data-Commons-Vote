use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Data::Commons::Vote::Image;
use Data::Commons::Vote::Person;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Test.
my $uploader = Data::Commons::Vote::Person->new(
	'name' => 'Zuzana Zonova',
);
my $obj = Data::Commons::Vote::Image->new(
	'image' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
isa_ok($obj, 'Data::Commons::Vote::Image');

# Test.
$obj = Data::Commons::Vote::Image->new(
	'author' => 'Zuzana Zonova',
	'comment' => 'Contemporary male portrait in black and white.',
	'height' => 800,
	'image' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
	'width' => 600,
);
isa_ok($obj, 'Data::Commons::Vote::Image');

# Test.
eval {
	Data::Commons::Vote::Image->new;
};
is($EVAL_ERROR, "Parameter 'image' is required.\n",
	"Parameter 'image' is required.");
clean();

# Test.
eval {
	Data::Commons::Vote::Image->new(
		'image' => 'Michal from Czechia.jpg',
	);
};
is($EVAL_ERROR, "Parameter 'uploader' is required.\n",
	"Parameter 'uploader' is required.");
clean();
