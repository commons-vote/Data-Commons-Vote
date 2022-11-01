use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::Person;
use DateTime;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Common.
my $creator = Data::Commons::Vote::Person->new(
	'name' => decode_utf8('Michal Josef Špaček'),
);

# Test.
my $obj = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
	'name' => 'Czech Wiki Photo 2021',
);
is($obj->wd_qid, undef, 'Get Wikidata QID (undef - default value).');

# Test.
$obj = Data::Commons::Vote::Competition->new(
	'created_by' => $creator,
	'name' => 'Czech Wiki Photo 2021',
	'wd_qid' => 'Q106748986',
);
is($obj->wd_qid, 'Q106748986', 'Get Wikidata QID (Q106748986).');
