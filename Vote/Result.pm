package Data::Commons::Vote::Result;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_required);

our $VERSION = 0.01;

has competition => (
	is => 'ro',
);

# TODO Results

sub BUILD {
	my $self = shift;

	# Check competition.
	check_required($self, 'competition');
	check_isa($self, 'competition', 'Data::Commons::Vote::Competition');

	return;
}

1;

__END__
