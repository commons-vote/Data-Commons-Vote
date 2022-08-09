package Data::Commons::Vote::Category;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_length check_number check_required);

our $VERSION = 0.01;

has category => (
	is => 'ro',
);

has section_id => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check category.
	check_required($self, 'category');
	check_length($self, 'category', 255);

	# Check section id.
	check_number($self, 'section_id');

	return;
}

1;

__END__
