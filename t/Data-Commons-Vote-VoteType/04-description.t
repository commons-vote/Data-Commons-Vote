use strict;
use warnings;

use Data::Commons::Vote::VoteType;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::VoteType->new(
	'type' => 'jury_marking',
);
is($obj->description, undef, 'Get description (undef - default).');

# Test.
$obj = Data::Commons::Vote::VoteType->new(
	'description' => 'Voting type for jury marking.',
	'type' => 'jury_marking',
);
is($obj->description, 'Voting type for jury marking.',
	'Get description (Voting type for jury marking.).');
