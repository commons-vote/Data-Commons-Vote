use strict;
use warnings;

use Data::Commons::Vote::License;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::License->new(
	'qid' => 'Q18199165',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
is($obj->qid, 'Q18199165', 'Get QID (Q18199165).');
