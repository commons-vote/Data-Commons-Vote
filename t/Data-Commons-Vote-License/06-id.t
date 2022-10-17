use strict;
use warnings;

use Data::Commons::Vote::License;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::License->new(
	'qid' => 'Q18199165',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
is($obj->id, undef, 'Get id (undef - default value).');

# Test.
$obj = Data::Commons::Vote::License->new(
	'id' => 1,
	'qid' => 'Q18199165',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
is($obj->id, 1, 'Get id (1).');
