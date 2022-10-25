package Data::Commons::Vote::CompetitionValidationOption;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

our $VERSION = 0.01;

has competition_validation => (
	is => 'ro',
);

has created_by => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has validation_option => (
	is => 'ro',
);

has value => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check competition_validation.
	check_required($self, 'competition_validation');
	check_isa($self, 'competition_validation', 'Data::Commons::Vote::CompetitionValidation', 'CompetitionValidation');

	# Check created_by.
	check_required($self, 'created_by');
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check id.
	check_number($self, 'id');

	# Check validation_option.
	check_required($self, 'validation_option');
	check_isa($self, 'validation_option', 'Data::Commons::Vote::ValidationOption', 'ValidationOption');

	# Check value.
	check_required($self, 'value');
	check_length($self, 'value', 100);

	return;
}

1;

__END__
