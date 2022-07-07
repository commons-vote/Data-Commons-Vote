use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Commons::Vote::Result',
	{ 'also_private' => ['BUILD'] },
	'Data::Commons::Vote::Result is covered.');
