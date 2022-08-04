use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Commons::Vote::PersonLogin', 'Data::Commons::Vote::PersonLogin is covered.');
