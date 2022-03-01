use strict;
use warnings;

use Data::Commons::Vote::Section;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Data::Commons::Vote::Section->new(
	'name' => 'Nature',
);
is($obj->name, 'Nature', 'Get name.');
