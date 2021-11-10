package Data::Commons::Vote::User;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_length check_required);

our $VERSION = 0.01;

has id => (
	is => 'ro',
);

has name => (
	is => 'ro',
);

has wm_username => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check id.
	check_required($self, 'id');

	# Check author.
	check_length($self, 'name', 255);

	# Check wikimedia username.
	check_length($self, 'wm_username', 255);

	return;
}

1;

__END__
