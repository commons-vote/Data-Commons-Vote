use strict;
use warnings;

use Data::Commons::Vote::ValidationType;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::ValidationType->new(
	'type' => 'check_author_photos',
);
is($obj->description, undef, 'Get description (undef - default).');

# Test.
$obj = Data::Commons::Vote::ValidationType->new(
	'description' => 'Checks number of photos by author.',
	'type' => 'check_author_photos',
);
is($obj->description, 'Checks number of photos by author.',
	'Get description (Checks number of photos by author.).');
