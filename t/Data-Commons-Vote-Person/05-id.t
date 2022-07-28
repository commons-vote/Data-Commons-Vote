use strict;
use warnings;

use Data::Commons::Vote::Person;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Person->new;
is($obj->id, undef, 'Get id (undef - default).');

# Test.
$obj = Data::Commons::Vote::Person->new(
	'id' => 1,
);
is($obj->id, 1, 'Get id (1).');
