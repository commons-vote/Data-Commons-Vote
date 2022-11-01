use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::Person;
use DateTime;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);

# Test.
my $obj = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
	'name' => 'Example competition',
);
is($obj->id, undef, 'Get id (undef - default).');

# Test.
$obj = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
	'id' => 1,
	'name' => 'Example competition',
);
is($obj->id, 1, 'Get id (1).');
