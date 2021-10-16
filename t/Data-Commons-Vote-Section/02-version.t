use strict;
use warnings;

use Data::Commons::Vote::Section;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::Section::VERSION, 0.01, 'Version.');
