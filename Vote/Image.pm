package Data::Commons::Vote::Image;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_required);

our $VERSION = 0.01;

has author => (
	is => 'ro',
);

has comment => (
	is => 'ro',
);

# Image from Commons.
has image => (
	is => 'ro',
);

has wikimedia_username => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check image.
	check_required($self, 'image');

	return;
}

1;

__END__
