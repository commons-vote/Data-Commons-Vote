use strict;
use warnings;

use Data::Commons::Vote::Category;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Category::VERSION, 0.01, 'Version.');
