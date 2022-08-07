use strict;
use warnings;

use Data::Commons::Vote::SectionCategory;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::Commons::Vote::SectionCategory::VERSION, 0.01, 'Version.');
