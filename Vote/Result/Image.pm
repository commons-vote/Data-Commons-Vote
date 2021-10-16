package Data::Commons::Vote::Result::Image;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_isa check_required);

our $VERSION = 0.01;

has image => (
	is => 'ro',
);

has number_of_votes => (
	default => 0,
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check image.
	check_required($self, 'image');
	check_isa($self, 'image', 'Data::Commons::Vote::Image');

	return;
}
1;

__END__
