use strict;
use warnings;

use Data::Commons::Vote::Image;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Image::VERSION, 0.01, 'Version.');
