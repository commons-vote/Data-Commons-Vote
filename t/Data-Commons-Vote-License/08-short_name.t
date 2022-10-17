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
is($obj->short_name, undef, 'Get short name (undef - default value).');

# Test.
$obj = Data::Commons::Vote::License->new(
	'short_name' => 'CC BY-SA 4.0',
	'qid' => 'Q18199165',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
is($obj->short_name, 'CC BY-SA 4.0', 'Get short name (CC BY-SA 4.0).');
