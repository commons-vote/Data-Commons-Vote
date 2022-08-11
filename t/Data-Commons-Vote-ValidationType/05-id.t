use strict;
use warnings;

use Data::Commons::Vote::ValidationType;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::ValidationType->new(
	'type' => 'check_author_photos',
);
is($obj->id, undef, 'Get id (undef - default).');

# Test.
$obj = Data::Commons::Vote::ValidationType->new(
	'id' => 1,
	'type' => 'check_author_photos',
);
is($obj->id, 1, 'Get id (1).');
