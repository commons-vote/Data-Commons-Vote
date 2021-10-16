use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Data::Commons::Vote::Section');
}

# Test.
require_ok('Data::Commons::Vote::Section');
