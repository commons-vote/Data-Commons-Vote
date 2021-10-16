use strict;
use warnings;

use Data::Commons::Vote::Image;
use Data::Commons::Vote::Section;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $img = Data::Commons::Vote::Image->new(
	'image' => 'Michal from Czechia.jpg',
);
my $obj = Data::Commons::Vote::Section->new(
	'images' => [$img],
	'logo' => 'Foo.jpg',
	'name' => 'Nature',
);
is($obj->logo, 'Foo.jpg', 'Get logo.');
