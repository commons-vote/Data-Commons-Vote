package Data::Commons::Vote::VoteStats;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_number check_required);

our $VERSION = 0.01;

has competition_voting => (
	is => 'ro',
);

has image => (
	is => 'ro',
);

has vote_count => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check competition_voting.
	check_required($self, 'competition_voting');
	check_isa($self, 'competition', 'Data::Commons::Vote::CompetitionVoting');

	# Check image.
	check_required($self, 'image');
	check_isa($self, 'image', 'Data::Commons::Vote::Image');

	# Check vote_count.
	check_number($self, 'vote_count');

	return;
}

1;

__END__
