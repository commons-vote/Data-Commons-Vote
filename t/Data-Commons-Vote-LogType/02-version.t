use strict;
use warnings;

use Data::Commons::Vote::LogType;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::LogType::VERSION, 0.01, 'Version.');
