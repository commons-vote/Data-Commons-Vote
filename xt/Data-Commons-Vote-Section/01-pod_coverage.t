use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Commons::Vote::Section', 'Data::Commons::Vote::Section is covered.');
