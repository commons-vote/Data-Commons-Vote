use strict;
use warnings;

use Data::Commons::Vote::Role;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Role::VERSION, 0.01, 'Version.');
