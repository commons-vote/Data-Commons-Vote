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
	'image' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
is($obj->id, undef, 'Get id (undef = default).');

# Test.
$obj = Data::Commons::Vote::Image->new(
	'author' => 'Zuzana Zonova',
	'id' => 1,
	'image' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
is($obj->id, 1, 'Get id (1).');
