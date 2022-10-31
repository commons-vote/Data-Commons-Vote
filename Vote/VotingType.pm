package Data::Commons::Vote::VotingType;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

our $VERSION = 0.01;

has created_by => (
	is => 'ro',
);

has description => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has type => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check created_by.
	check_required($self, 'created_by');
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check description.
	check_length($self, 'description', 255);

	# Check id.
	check_number($self, 'id');

	# Check type.
	check_required($self, 'type');
	check_length($self, 'type', 50);

	return;
}

1;

__END__
