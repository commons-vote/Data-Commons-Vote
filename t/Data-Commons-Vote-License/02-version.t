use strict;
use warnings;

use Data::Commons::Vote::License;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::License::VERSION, 0.01, 'Version.');
