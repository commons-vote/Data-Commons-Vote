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

sub BUILD {
	my $self = shift;

	# Check author.
	check_length($self, 'author', 255);

	# Check comment.
	check_length($self, 'comment', 1000);

	# Check id.
	check_required($self, 'id');
	check_number($self, 'id');

	# Check image.
	check_required($self, 'image');
	check_length($self, 'image', 255);

	# Check uploader.
	check_required($self, 'uploader');
	check_isa($self, 'uploader', 'Data::Commons::Vote::User');

	return;
}

1;

__END__
