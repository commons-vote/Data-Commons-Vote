package Data::Commons::Vote::User;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

our $VERSION = 0.01;

has first_upload_at => (
	is => 'ro',
);

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

	# Check first_upload_at.
	if (defined $self->{'first_upload_at'}) {
		check_isa($self, 'first_upload_at', 'DateTime');
	}

	# Check id.
	check_number($self, 'id');

	# Check author.
	check_length($self, 'name', 255);

	# Check wikimedia username.
	check_length($self, 'wm_username', 255);

	return;
}

1;

__END__
