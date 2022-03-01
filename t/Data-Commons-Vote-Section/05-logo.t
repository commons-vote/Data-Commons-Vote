use strict;
use warnings;

use Data::Commons::Vote::Section;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Section->new(
	'logo' => 'Foo.jpg',
	'name' => 'Nature',
);
is($obj->logo, 'Foo.jpg', 'Get logo.');
