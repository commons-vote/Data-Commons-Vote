use strict;
use warnings;

use Data::Commons::Vote::ValidationType;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::ValidationType->new(
	'type' => 'check_author_photos',
);
is($obj->type, 'check_author_photos', 'Get type (check_author_photos).');
