use strict;
use warnings;

use Data::Commons::Vote::Log;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Log::VERSION, 0.01, 'Version.');
