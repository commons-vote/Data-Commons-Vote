use strict;
use warnings;

use Data::Commons::Vote::ValidationOption;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::ValidationOption::VERSION, 0.01, 'Version.');
