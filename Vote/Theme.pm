package Data::Commons::Vote::Theme;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_isa check_array_object check_length check_number check_required);

our $VERSION = 0.01;

has created_by => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

# List of images in theme.
has images => (
	default => [],
	is => 'ro',
);

has name => (
	is => 'ro',
);

has shortcut => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check created_by.
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check id.
	check_number($self, 'id');

	# Check images.
	check_array_object($self, 'images', 'Data::Commons::Vote::Image', 'Image');

	# Check name.
	check_required($self, 'name');
	check_length($self, 'name', 255);

	# Check shortcut.
	check_length($self, 'shortcut', 10);

	return;
}

1;

__END__
