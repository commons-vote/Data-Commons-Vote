package Data::Commons::Vote::Competition;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_array_object check_isa check_length check_required);

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

has number_of_votes => (
	is => 'ro',
);

has organizer => (
	is => 'ro',
);

# Organizer logo from Commons.
has organizer_logo => (
	is => 'ro',
);

has sections => (
	default => [],
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check dt_from
	check_required($self, 'dt_from');
	check_isa($self, 'dt_from', 'DateTime');

	# Check dt_to
	check_required($self, 'dt_to');
	check_isa($self, 'dt_to', 'DateTime');

	# Check name
	check_required($self, 'name');
	check_length($self, 'name', 255);

	# Check logo.
	check_length($self, 'logo', 255);

	# Check sections.
	check_array_object($self, 'sections', 'Data::Commons::Vote::Section', 'Section');

	# Check organizer.
	check_length($self, 'organizer', 255);

	# Check organizer logo.
	check_length($self, 'organizer_logo', 255);

	# Check number.
	# XXX Check for defined in Mo::utils?
	if (defined $self->{'number_of_votes'}) {
		check_number($self, 'number_of_votes');
	}

	return;
}

1;

__END__
