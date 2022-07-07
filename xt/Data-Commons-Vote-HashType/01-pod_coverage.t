use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Commons::Vote::HashType',
	{ 'also_private' => ['BUILD'] },
	'Data::Commons::Vote::HashType is covered.');
