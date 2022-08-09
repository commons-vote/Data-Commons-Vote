package Data::Commons::Vote::Image;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

our $VERSION = 0.01;

has author => (
	is => 'ro',
);

has comment => (
	is => 'ro',
);

has created_by => (
	is => 'ro',
);

has dt_created => (
	is => 'ro',
);

has height => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

# Image from Commons.
has image => (
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

	# Check comment.
	check_length($self, 'comment', 1000);

	# Check created_by.
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check date created.
	check_isa($self, 'dt_created', 'DateTime');

	# Check height.
	check_number($self, 'height');

	# Check id.
	check_number($self, 'id');

	# Check image.
	check_required($self, 'image');
	check_length($self, 'image', 255);

	# Check uploader.
	check_required($self, 'uploader');
	check_isa($self, 'uploader', 'Data::Commons::Vote::Person');

	# Check width.
	check_number($self, 'width');

	return;
}

1;

__END__
