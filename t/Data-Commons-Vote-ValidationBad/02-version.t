use strict;
use warnings;

use Data::Commons::Vote::ValidationBad;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::ValidationBad::VERSION, 0.01, 'Version.');
