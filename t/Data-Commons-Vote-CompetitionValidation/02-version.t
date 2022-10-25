use strict;
use warnings;

use Data::Commons::Vote::CompetitionValidation;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::CompetitionValidation::VERSION, 0.01, 'Version.');
