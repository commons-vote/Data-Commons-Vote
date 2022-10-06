use strict;
use warnings;

use Data::Commons::Vote::Image;
use Data::Commons::Vote::Person;
use DateTime;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $uploader = Data::Commons::Vote::Person->new(
	'name' => 'Zuzana Zonova',
);
my $obj = Data::Commons::Vote::Image->new(
	'commons_name' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
is($obj->dt_created, undef, 'Get dt_created (undef = default).');

# Test.
$obj = Data::Commons::Vote::Image->new(
	'author' => 'Zuzana Zonova',
	'dt_created' => DateTime->new(
		'day' => 14,
		'month' => 7,
		'year' => 2022,
	),
	'commons_name' => 'Michal from Czechia.jpg',
	'uploader' => $uploader,
);
is($obj->dt_created, '2022-07-14T00:00:00', 'Get dt_created (2022-07-14T00:00:00).');
