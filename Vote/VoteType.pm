package Data::Commons::Vote::VoteType;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_length check_number check_required);

our $VERSION = 0.01;

# Vote type id.
has id => (
	is => 'ro',
);

has type => (
	is => 'ro',
);

has description => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check id.
	check_number($self, 'id');

	# Check type.
	check_required($self, 'type');
	check_length($self, 'type', 30);

	# Check description.
	check_length($self, 'description', 255);

	return;
}

1;

__END__
