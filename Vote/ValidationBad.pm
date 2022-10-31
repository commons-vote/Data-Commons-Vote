package Data::Commons::Vote::ValidationBad;

use strict;
use warnings;

use Error::Pure qw(err);
use List::Util qw(none);
use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);
use Readonly;

Readonly::Array our @OPTION_TYPES => qw(date number);

our $VERSION = 0.01;

has competition => (
	is => 'ro',
);

has created_by => (
	is => 'ro',
);

has image => (
	is => 'ro',
);

has validation_type => {
	is => 'ro',
};

sub BUILD {
	my $self = shift;

	# Check competition.
	check_required($self, 'competition');
	check_isa($self, 'competition', 'Data::Commons::Vote::Competition');

	# Check created_by.
	check_required($self, 'created_by');
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check image.
	check_required($self, 'image');
	check_isa($self, 'image', 'Data::Commons::Vote::Image', 'Image');

	# Check validation_type.
	check_required($self, 'validation_type');
	check_isa($self, 'validation_type', 'Data::Commons::Vote::ValidationType', 'ValidationType');

	return;
}

1;

__END__
