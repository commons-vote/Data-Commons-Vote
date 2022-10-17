package Data::Commons::Vote::License;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

our $VERSION = 0.01;

has created_at => (
	is => 'ro',
);

has created_by => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has qid => (
	is => 'ro',
);

has short_name => (
	is => 'ro',
);

has text => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check created_at.
	check_isa($self, 'created_at', 'DateTime');

	# Check created_by.
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check id.
	check_number($self, 'id');

	# Check QID.
	check_required($self, 'qid');
	check_length($self, 'qid', 30);

	# Check short_name.
	check_length($self, 'short_name', 50);

	# Check text.
	check_required($self, 'text');
	check_length($self, 'text', 255);

	return;
}

1;

__END__
