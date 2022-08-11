use strict;
use warnings;

use Data::Commons::Vote::VoteType;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::VoteType->new(
	'type' => 'jury_marking',
);
is($obj->type, 'jury_marking', 'Get type (jury_marking).');
