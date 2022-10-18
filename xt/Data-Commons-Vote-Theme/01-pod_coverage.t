use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Commons::Vote::Theme', 'Data::Commons::Vote::Theme is covered.');
