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
is($obj->text, 'Creative Commons Attribution-ShareAlike 4.0 International',
	'Get text (Creative Commons Attribution-ShareAlike 4.0 International).');
