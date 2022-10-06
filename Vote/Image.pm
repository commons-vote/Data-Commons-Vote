package Data::Commons::Vote::Image;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

extends 'Data::Commons::Image';

our $VERSION = 0.01;

has author => (
	is => 'ro',
);

has created_by => (
	is => 'ro',
);

has dt_created => (
	is => 'ro',
);

has dt_uploaded => (
	is => 'ro',
);

has height => (
	is => 'ro',
);

has size => (
	is => 'ro',
);

has uploader => (
	is => 'ro',
);

has width => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check author.
	check_length($self, 'author', 255);

	# Check created_by.
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check date created.
	check_isa($self, 'dt_created', 'DateTime');

	# Check date uploaded.
	check_isa($self, 'dt_uploaded', 'DateTime');

	# Check height.
	check_number($self, 'height');

	# Check size.
	check_number($self, 'size');

	# Check uploader.
	check_required($self, 'uploader');
	check_isa($self, 'uploader', 'Data::Commons::Vote::Person');

	# Check width.
	check_number($self, 'width');

	return;
}

1;

__END__
