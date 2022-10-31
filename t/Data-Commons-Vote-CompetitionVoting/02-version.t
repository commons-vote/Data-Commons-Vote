use strict;
use warnings;

use Data::Commons::Vote::CompetitionVoting;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::CompetitionVoting::VERSION, 0.01, 'Version.');
