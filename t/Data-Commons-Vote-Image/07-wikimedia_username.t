use strict;
use warnings;

use Data::Commons::Vote::Image;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Image->new(
	'image' => 'Michal from Czechia.jpg',
);
is($obj->wikimedia_username, undef, 'Get wikimedia username (undef = default).');

# Test.
$obj = Data::Commons::Vote::Image->new(
	'author' => 'Zuzana Zonova',
	'comment' => 'Contemporary male portrait in black and white.',
	'image' => 'Michal from Czechia.jpg',
	'wikimedia_username' => 'Zuzana_Zonova',
);
is($obj->wikimedia_username, 'Zuzana_Zonova', 'Get wikimedia username.');
