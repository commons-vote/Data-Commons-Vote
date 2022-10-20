package Data::Commons::Vote::Image;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number check_required);

extends 'Data::Commons::Image';

our $VERSION = 0.01;

has created_by => (
	is => 'ro',
);

has license_obj => (
	is => 'ro',
);

has uploader => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check created_by.
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check uploader.
	check_isa($self, 'uploader', 'Data::Commons::Vote::Person');

	# Check license obj.
	check_isa($self, 'license_obj', 'Data::Commons::Vote::License');
	if (defined $self->{'license_obj'} && ! defined $self->{'license'}) {
		$self->{'license'} = $self->{'license_obj'}->text;
	}

	return;
}

1;

__END__
