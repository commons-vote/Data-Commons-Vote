use strict;
use warnings;

use Data::Commons::Vote::License;
use DateTime;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::License->new(
	'qid' => 'Q18199165',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
is($obj->created_at, undef, 'Get created at datetime (undef - default value).');

# Test.
$obj = Data::Commons::Vote::License->new(
	'created_at' => DateTime->new(
		'year' => 2022,
		'month' => 7,
		'day' => 14,
	),
	'qid' => 'Q18199165',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
is($obj->created_at, '2022-07-14T00:00:00', 'Get created at datetime (2022-07-14T00:00:00).');
