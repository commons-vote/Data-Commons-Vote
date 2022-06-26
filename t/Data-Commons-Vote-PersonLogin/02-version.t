use strict;
use warnings;

use Data::Commons::Vote::PersonLogin;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::PersonLogin::VERSION, 0.01, 'Version.');
