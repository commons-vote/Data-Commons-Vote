use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Competition::VERSION, 0.01, 'Version.');
