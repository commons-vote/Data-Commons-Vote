use strict;
use warnings;

use Data::Commons::Vote::Image;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Image->new(
	'image' => 'Michal from Czechia.jpg',
);
is($obj->image, 'Michal from Czechia.jpg', 'Get image.');
