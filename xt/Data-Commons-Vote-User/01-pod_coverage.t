use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::Commons::Vote::User',
	{ 'also_private' => ['BUILD'] },
	'Data::Commons::Vote::User is covered.');
