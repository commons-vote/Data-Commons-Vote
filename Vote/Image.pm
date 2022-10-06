package Data::Commons::Vote::Image;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

extends 'Data::Commons::Image';

our $VERSION = 0.01;

has created_by => (
	is => 'ro',
);

has dt_created => (
	is => 'ro',
);

has dt_uploaded => (
	is => 'ro',
);

has uploader => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check created_by.
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check date created.
	check_isa($self, 'dt_created', 'DateTime');

	# Check date uploaded.
	check_isa($self, 'dt_uploaded', 'DateTime');

	# Check uploader.
	check_required($self, 'uploader');
	check_isa($self, 'uploader', 'Data::Commons::Vote::Person');

	return;
}

1;

__END__
