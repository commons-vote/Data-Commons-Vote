package Data::Commons::Vote::CompetitionVoting;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_array_object check_isa check_number check_required);

our $VERSION = 0.01;

has competition => (
	is => 'ro',
);

has created_by => (
	is => 'ro',
);

has dt_from => (
	is => 'ro',
);

has dt_to => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has number_of_votes => (
	is => 'ro',
	default => 0,
);

has voting_type => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check competition.
	check_required($self, 'competition');
	check_isa($self, 'competition', 'Data::Commons::Vote::Competition', 'Competition');

	# Check created_by.
	check_required($self, 'created_by');
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check dt_from
	check_required($self, 'dt_from');
	check_isa($self, 'dt_from', 'DateTime');

	# Check dt_to
	check_required($self, 'dt_to');
	check_isa($self, 'dt_to', 'DateTime');

	# Check id.
	check_number($self, 'id');

	# Check number of votes.
	check_number($self, 'number_of_votes');

	# Check validation_type.
	check_required($self, 'voting_type');
	check_isa($self, 'voting_type', 'Data::Commons::Vote::VotingType', 'VotingType');

	return;
}

1;

__END__
