package Data::Commons::Vote::Role;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_length check_number check_required);

our $VERSION = 0.01;

# role id.
has id => (
	is => 'ro',
);

has name => (
	is => 'ro',
);

has description => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check id.
	check_number($self, 'id');

	# Check name.
	check_required($self, 'name');
	check_length($self, 'name', 30);

	# Check description.
	check_length($self, 'description', 255);

	return;
}

1;

__END__
