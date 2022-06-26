use strict;
use warnings;

use Data::Commons::Vote::Person;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Person::VERSION, 0.01, 'Version.');
