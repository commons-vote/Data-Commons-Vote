use strict;
use warnings;

use Data::Commons::Vote::ThemeImage;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::ThemeImage::VERSION, 0.01, 'Version.');
