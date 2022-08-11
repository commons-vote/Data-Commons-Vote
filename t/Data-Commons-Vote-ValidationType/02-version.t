use strict;
use warnings;

use Data::Commons::Vote::ValidationType;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::ValidationType::VERSION, 0.01, 'Version.');
