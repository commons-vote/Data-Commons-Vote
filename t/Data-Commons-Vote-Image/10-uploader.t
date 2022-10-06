use strict;
use warnings;

use Data::Commons::Vote::Image;
use Data::Commons::Vote::Person;
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
isa_ok($obj->uploader, 'Data::Commons::Vote::Person');
is($obj->uploader->name, 'Zuzana Zonova', 'Get uploader name.');
