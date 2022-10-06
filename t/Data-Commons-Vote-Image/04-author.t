use strict;
use warnings;

use Data::Commons::Vote::Image;
use Data::Commons::Vote::Person;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $uploader = Data::Commons::Vote::Person->new(
	'name' => 'Zuzana Zonova',
);
my $obj = Data::Commons::Vote::Image->new(
	'commons_name' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
is($obj->author, undef, 'Get author name (undef = default).');

# Test.
$obj = Data::Commons::Vote::Image->new(
	'author' => 'Zuzana Zonova',
	'comment' => 'Contemporary male portrait in black and white.',
	'commons_name' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
is($obj->author, 'Zuzana Zonova', 'Get author name.');
