use strict;
use warnings;

use Data::Commons::Vote::VoteStats;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::VoteStats::VERSION, 0.01, 'Version.');
