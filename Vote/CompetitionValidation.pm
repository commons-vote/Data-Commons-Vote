package Data::Commons::Vote::CompetitionValidation;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_array_object check_isa check_number check_required);

our $VERSION = 0.01;

has competition => (
	is => 'ro',
);

has created_by => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has options => (
	default => [],
	is => 'ro',
);

has validation_type => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check competition.
	check_required($self, 'competition');
	check_isa($self, 'competition', 'Data::Commons::Vote::Competition', 'Competition');

	# Check created_by.
	check_required($self, 'created_by');
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check id.
	check_number($self, 'id');

	# Check options.
	check_array_object($self, 'options', 'Data::Commons::Vote::CompetitionValidationOption', 'Section');

	# Check validation_type.
	check_required($self, 'validation_type');
	check_isa($self, 'validation_type', 'Data::Commons::Vote::ValidationType', 'ValidationType');

	return;
}

1;

__END__
