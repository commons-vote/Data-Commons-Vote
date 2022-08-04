#!/usr/bin/env perl

use strict;
use warnings;

use Data::Commons::Vote::Competition;
use DateTime;

my $obj = Data::Commons::Vote::Competition->new(
        'dt_from' => DateTime->new(
                'day' => 10,
                'month' => 7,
                'year' => 2022,
        ),
        'dt_to' => DateTime->new(
                'day' => 20,
                'month' => 7,
                'year' => 2022,
        ),
        'id' => 1,
        'jury_voting' => 1,
        'name' => 'Competition',
        'public_voting' => 1,
);

# Print out.
print 'Id: '.$obj->id."\n";
print 'Name: '.$obj->name."\n";
print 'Date from: '.$obj->dt_from."\n";
print 'Date to: '.$obj->dt_to."\n";
print 'Jury voting: '.$obj->jury_voting."\n";
print 'Public voting: '.$obj->public_voting."\n";
print 'Number of votes: '.$obj->number_of_votes."\n";

# Output:
# Id: 1
# Name: Competition
# Date from: 2022-07-10T00:00:00
# Date to: 2022-07-20T00:00:00
# Jury voting: 1
# Public voting: 1
# Number of votes: 0