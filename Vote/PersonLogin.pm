package Data::Commons::Vote::PersonLogin;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa);

our $VERSION = 0.01;

has hash_type => (
	is => 'ro',
);

has login => (
	is => 'ro',
);

has password => (
	is => 'ro',
);

has person => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check user.
	check_isa($self, 'person', 'Data::Commons::Vote::Person');

	# Check hash type.
	check_isa($self, 'hash_type', 'Data::HashType');

	return;
}

1;

__END__
