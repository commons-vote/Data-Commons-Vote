use strict;
use warnings;

use Data::Commons::Vote::Image;
use Data::Commons::Vote::Section;
use Data::Commons::Vote::User;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $uploader = Data::Commons::Vote::User->new(
	'name' => 'Zuzana Zonova',
);
my $img = Data::Commons::Vote::Image->new(
	'image' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
my $obj = Data::Commons::Vote::Section->new(
	'images' => [$img],
	'name' => 'Nature',
);
my $images_ar = $obj->images;
is(@{$images_ar}, 1, 'Get number of images (1).');
