package Data::Commons::Vote::Result::Image;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_isa check_required);

our $VERSION = 0.01;

has competition => (
	is => 'ro',
);

has image => (
	is => 'ro',
);

has number_of_votes => (
	default => 0,
	is => 'ro',
);

has section => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check competition.
	check_required($self, 'competition');
	check_isa($self, 'competition', 'Data::Commons::Vote::Competition');

	# Check image.
	check_required($self, 'image');
	check_isa($self, 'image', 'Data::Commons::Vote::Image');

	# Check section.
	check_required($self, 'section');
	check_isa($self, 'section', 'Data::Commons::Vote::Section');

	return;
}
1;

__END__
