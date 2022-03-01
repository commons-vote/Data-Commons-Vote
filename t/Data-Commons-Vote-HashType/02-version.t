use strict;
use warnings;

use Data::Commons::Vote::HashType;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::HashType::VERSION, 0.01, 'Version.');
