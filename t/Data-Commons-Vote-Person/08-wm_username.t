use strict;
use warnings;

use Data::Commons::Vote::Person;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $obj = Data::Commons::Vote::Person->new;
is($obj->wm_username, undef, 'Get Wikimedia username (undef - default).');

# Test.
$obj = Data::Commons::Vote::Person->new(
	'wm_username' => 'Skim',
);
is($obj->wm_username, 'Skim', 'Get Wikimedia username (Skim).');
