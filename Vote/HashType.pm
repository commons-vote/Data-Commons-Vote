package Data::Commons::Vote::HashType;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_bool check_length check_number check_required);

our $VERSION = 0.01;

has active => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has name => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check active.
	check_required($self, 'active');
	check_bool($self, 'active');

	# Check id.
	check_number($self, 'id');

	# Check hash name.
	check_required($self, 'name');
	check_length($self, 'name', 50);

	return;
}

1;

__END__
