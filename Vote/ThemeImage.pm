package Data::Commons::Vote::ThemeImage;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

our $VERSION = 0.01;

has created_by => (
	is => 'ro',
);

has image => (
	is => 'ro',
);

has theme_id => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check created_by.
	check_required($self, 'created_by');
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check image.
	check_required($self, 'image');
	check_isa($self, 'Data::Common::Vote::Image');

	# Check theme id.
	check_required($self, 'theme_id');
	check_number($self, 'theme_id');

	return;
}

1;

__END__
