package Data::Commons::Vote::ValidationOption;

use strict;
use warnings;

use Error::Pure qw(err);
use List::Util qw(none);
use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);
use Readonly;

Readonly::Array our @OPTION_TYPES => qw(date number);

our $VERSION = 0.01;

has created_by => (
	is => 'ro',
);

has description => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has option => (
	is => 'ro',
);

has option_type => (
	is => 'ro',
);

has validation_type => {
	is => 'ro',
};

sub BUILD {
	my $self = shift;

	# Check created_by.
	check_required($self, 'created_by');
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check description.
	check_length($self, 'description', 255);

	# Check id.
	check_number($self, 'id');

	# Check option.
	check_required($self, 'option');
	check_length($self, 'option', 30);

	# Check option_type.
	check_required($self, 'option_type');
	if (none { $self->{'option_type'} eq $_ } @OPTION_TYPES) {
		err "Parameter 'option_type' has bad value.",
			'Type', $self->{'option_type'},
		;
	}

	# Check validation_type.
	check_required($self, 'validation_type');
	check_isa($self, 'validation_type', 'Data::Commons::Vote::ValidationType', 'ValidationType');

	return;
}

1;

__END__
