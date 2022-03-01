use strict;
use warnings;

use Data::Commons::Vote::UserLogin;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::UserLogin::VERSION, 0.01, 'Version.');
