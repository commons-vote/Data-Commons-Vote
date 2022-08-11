use strict;
use warnings;

use Data::Commons::Vote::PersonRole;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::PersonRole::VERSION, 0.01, 'Version.');
