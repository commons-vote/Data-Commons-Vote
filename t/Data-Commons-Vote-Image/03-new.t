use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Data::Commons::Vote::Image;
use Data::Commons::Vote::Person;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Image->new(
	'commons_name' => 'Michal from Czechia.jpg',
);
isa_ok($obj, 'Data::Commons::Vote::Image');

# Test.
my $uploader = Data::Commons::Vote::Person->new(
	'name' => 'Zuzana Zonova',
);
$obj = Data::Commons::Vote::Image->new(
	'author' => 'Zuzana Zonova',
	'comment' => 'Contemporary male portrait in black and white.',
	'height' => 800,
	'commons_name' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
	'width' => 600,
);
isa_ok($obj, 'Data::Commons::Vote::Image');

# Test.
eval {
	Data::Commons::Vote::Image->new;
};
is($EVAL_ERROR, "Parameter 'commons_name' is required.\n",
	"Parameter 'commons_name' is required.");
clean();
