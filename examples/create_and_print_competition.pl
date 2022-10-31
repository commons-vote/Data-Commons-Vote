#!/usr/bin/env perl

use strict;
use warnings;

use Data::Commons::Vote::Competition;
use Data::Commons::Vote::Person;
use DateTime;

my $obj = Data::Commons::Vote::Competition->new(
        'created_by' => Data::Commons::Vote::Person->new(
                'name' => 'Michal Josef Spacek',
        ),
        'id' => 1,
        'name' => 'Competition',
);

# Print out.
print 'Id: '.$obj->id."\n";
print 'Name: '.$obj->name."\n";

# Output:
# Id: 1
# Name: Competition