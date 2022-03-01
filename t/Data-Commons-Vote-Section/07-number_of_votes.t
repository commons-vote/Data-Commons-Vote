use strict;
use warnings;

use Data::Commons::Vote::Section;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Section->new(
	'name' => 'Nature',
	'number_of_votes' => 3,
);
is($obj->number_of_votes, 3, 'Get number of votes.');
