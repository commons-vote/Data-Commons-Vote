package Data::Commons::Vote::ValidationType;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_length check_number check_required);

our $VERSION = 0.01;

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

	# Check description.
	check_length($self, 'description', 255);

	# Check id.
	check_number($self, 'id');

	# Check type.
	check_required($self, 'type');
	check_length($self, 'type', 30);

	return;
}

1;

__END__
