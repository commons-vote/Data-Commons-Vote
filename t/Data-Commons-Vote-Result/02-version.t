use strict;
use warnings;

use Data::Commons::Vote::Result;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Result::VERSION, 0.01, 'Version.');
