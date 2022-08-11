use strict;
use warnings;

use Data::Commons::Vote::VoteType;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::VoteType->new(
	'type' => 'jury_marking',
);
is($obj->id, undef, 'Get id (undef - default).');

# Test.
$obj = Data::Commons::Vote::VoteType->new(
	'id' => 1,
	'type' => 'jury_marking',
);
is($obj->id, 1, 'Get id (1).');
