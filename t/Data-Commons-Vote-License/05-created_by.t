use strict;
use warnings;

use Data::Commons::Vote::License;
use Data::Commons::Vote::Person;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::License->new(
	'qid' => 'Q18199165',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
is($obj->created_by, undef, 'Get created by (undef - default value).');

# Test.
my $creator = Data::Commons::Vote::Person->new(
	'name' => 'Michal Josef Spacek',
);
$obj = Data::Commons::Vote::License->new(
	'created_by' => $creator,
	'qid' => 'Q18199165',
	'text' => 'Creative Commons Attribution-ShareAlike 4.0 International',
);
is($obj->created_by->name, 'Michal Josef Spacek', 'Get created by (Michal Josef Spacek).');
