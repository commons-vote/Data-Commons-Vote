package Data::Commons::Vote::Competition;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_array_object check_required);

our $VERSION = 0.01;

has dt_from => (
	is => 'ro',
);

has dt_to => (
	is => 'ro',
);

has name => (
	is => 'ro',
);

# Logo from Commons.
has logo => (
	is => 'ro',
);

has organizer => (
	is => 'ro',
);

# Organizer logo from Commons.
has organizer_logo => (
	is => 'ro',
);

has images => (
	default => [],
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check dt_from
	check_required($self, 'dt_from');

	# Check dt_to
	check_required($self, 'dt_to');

	# Check name
	check_required($self, 'name');

	# Check images.
	check_required($self, 'images');
	check_array_object($self, 'images', 'Data::Commons::Vote::Image', 'Image');

	return;
}

1;

__END__
