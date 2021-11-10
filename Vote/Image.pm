package Data::Commons::Vote::Image;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_length check_required);

our $VERSION = 0.01;

has author => (
	is => 'ro',
);

has comment => (
	is => 'ro',
);

# Image from Commons.
has image => (
	is => 'ro',
);

has wikimedia_username => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check author.
	check_length($self, 'author', 255);

	# Check comment.
	check_length($self, 'comment', 1000);

	# Check image.
	check_required($self, 'image');
	check_length($self, 'image', 255);

	# Check wikimedia username.
	check_length($self, 'wikimedia_username', 255);

	return;
}

1;

__END__
