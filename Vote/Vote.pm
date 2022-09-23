package Data::Commons::Vote::Vote;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

our $VERSION = 0.01;

has image => (
	is => 'ro',
);

has person => (
	is => 'ro',
);

has vote_type => (
	is => 'ro',
);

has vote_value => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check image.
	check_requires($self, 'image');
	check_isa($self, 'image', 'Data::Commons::Vote::Image');

	# Check person.
	check_requires($self, 'person');
	check_isa($self, 'person', 'Data::Commons::Vote::Person');

	# Check vote type.
	check_required($self, 'vote_type');
	check_isa($self, 'vote_type', 'Data::Commons::Vote::VoteType');

	# Check vote value.
	check_number($self, 'vote_value');

	return;
}

1;

__END__
