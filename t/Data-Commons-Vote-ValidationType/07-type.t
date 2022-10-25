use strict;
use warnings;

use Data::Commons::Vote::Person;
use Data::Commons::Vote::ValidationType;
use Test::More 'tests' => 2;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);

# Test.
my $obj = Data::Commons::Vote::ValidationType->new(
	'created_by' => $creator,
	'type' => 'check_author_photos',
);
is($obj->type, 'check_author_photos', 'Get type (check_author_photos).');
