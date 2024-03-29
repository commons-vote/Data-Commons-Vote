package Data::Commons::Vote::PersonRole;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_number check_required);

our $VERSION = 0.01;

has competition => (
	is => 'ro',
);

has created_by => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has person => (
	is => 'ro',
);

has role => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check competition.
	check_required($self, 'competition');
	check_isa($self, 'competition', 'Data::Commons::Vote::Competition');

	# Check created_by.
	check_required($self, 'created_by');
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check id.
	check_number($self, 'id');

	# Check person.
	check_required($self, 'person');
	check_isa($self, 'person', 'Data::Commons::Vote::Person');

	# Check role.
	check_required($self, 'role');
	check_isa($self, 'role', 'Data::Commons::Vote::Role');

	return;
}

1;

__END__
