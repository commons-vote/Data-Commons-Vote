use strict;
use warnings;

use Data::Commons::Vote::VotingType;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::VotingType::VERSION, 0.01, 'Version.');
