package Data::Commons::Vote::Section;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_array_object check_number check_required);

our $VERSION = 0.01;

has images => (
	default => [],
	is => 'ro',
);

# Logo from Commons.
has logo => (
	is => 'ro',
);

has name => (
	is => 'ro',
);

has number_of_votes => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check name
	check_required($self, 'name');

	# Check images.
	check_required($self, 'images');
	check_array_object($self, 'images', 'Data::Commons::Vote::Image', 'Image');

	# Check number.
	if (defined $self->{'number_of_votes'}) {
		check_number($self, 'number_of_votes');
	}

	return;
}

1;

__END__
