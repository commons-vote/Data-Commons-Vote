use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Commons::Vote::Person',
	{ 'also_private' => ['BUILD'] },
	'Data::Commons::Vote::Person is covered.');
