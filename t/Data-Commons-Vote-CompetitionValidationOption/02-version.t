use strict;
use warnings;

use Data::Commons::Vote::CompetitionValidationOption;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::CompetitionValidationOption::VERSION, 0.01, 'Version.');
