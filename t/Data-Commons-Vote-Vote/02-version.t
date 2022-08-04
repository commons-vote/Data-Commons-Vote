use strict;
use warnings;

use Data::Commons::Vote::Vote;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Vote::VERSION, 0.01, 'Version.');
