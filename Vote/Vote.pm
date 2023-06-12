package Data::Commons::Vote::Vote;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

our $VERSION = 0.01;

has competition_voting => (
	is => 'ro',
);

has image => (
	is => 'ro',
);

has person => (
	is => 'ro',
);

has vote_value => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check competition.
	check_required($self, 'competition_voting');
	check_isa($self, 'competition_voting', 'Data::Commons::Vote::CompetitionVoting');

	# Check image.
	check_required($self, 'image');
	check_isa($self, 'image', 'Data::Commons::Vote::Image');

	# Check person.
	check_isa($self, 'person', 'Data::Commons::Vote::Person');

	return;
}

1;

__END__
