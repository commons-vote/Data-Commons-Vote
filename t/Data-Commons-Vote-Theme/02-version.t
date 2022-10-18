use strict;
use warnings;

use Data::Commons::Vote::Theme;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Theme::VERSION, 0.01, 'Version.');
