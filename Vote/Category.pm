package Data::Commons::Vote::Category;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_length check_required);

our $VERSION = 0.01;

has category => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check category.
	check_required($self, 'category');
	check_length($self, 'category', 255);

	return;
}

1;

__END__
