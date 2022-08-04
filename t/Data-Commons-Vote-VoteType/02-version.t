use strict;
use warnings;

use Data::Commons::Vote::VoteType;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::VoteType::VERSION, 0.01, 'Version.');
