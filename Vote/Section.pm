package Data::Commons::Vote::Section;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_isa check_array_object check_length check_number check_required);

our $VERSION = 0.01;

has categories => (
	default => [],
	is => 'ro',
);

has competition => (
	is => 'ro',
);

# Section id.
has id => (
	is => 'ro',
);

# List of images in section.
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
	default => 0,
);

sub BUILD {
	my $self = shift;

	# Check categories.
	check_array_object($self, 'categories', 'Data::Commons::Vote::Category', 'Category');

	# Check competition.
	check_isa($self, 'competition', 'Data::Commons::Vote::Competition', 'Competition');

	# Check id.
	check_number($self, 'id');

	# Check name
	check_required($self, 'name');
	check_length($self, 'name', 255);

	# Check images.
	check_array_object($self, 'images', 'Data::Commons::Vote::Image', 'Image');

	# Check logo.
	check_length($self, 'logo', 255);

	# Check number.
	check_number($self, 'number_of_votes');

	return;
}

1;

__END__
