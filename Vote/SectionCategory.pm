package Data::Commons::Vote::SectionCategory;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_required);

our $VERSION = 0.01;

has section => (
	is => 'ro',
);

has category => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check section.
	check_isa($self, 'section', 'Data::Commons::Vote::Section');

	# Check category.
	check_required($self, 'category');
	check_length($self, 'category', 255);

	return;
}

1;

__END__
