package Data::Commons::Vote::Log;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_number check_required);

our $VERSION = 0.01;

has competition => (
	is => 'ro',
);

has created_at => (
	is => 'ro',
);

has created_by => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has log => (
	is => 'ro',
);

has log_type => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check competition.
	check_required($self, 'competition');
	check_isa($self, 'competition', 'Data::Commons::Vote::Competition');

	# Check created_at.
	check_isa($self, 'created_at', 'DateTime');

	# Check created_by.
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check id.
	check_number($self, 'id');

	# Check log type.
	check_required($self, 'log_type');
	check_isa($self, 'log_type', 'Data::Commons::Vote::LogType');

	return;
}

1;

__END__
