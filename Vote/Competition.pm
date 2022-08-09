package Data::Commons::Vote::Competition;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build default is);
use Mo::utils qw(check_array_object check_bool check_isa check_length check_number check_required);

our $VERSION = 0.01;

has created_by => (
	is => 'ro',
);

has dt_from => (
	is => 'ro',
);

has dt_to => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has jury_max_marking_number => (
	is => 'ro',
	default => 5,
);

has jury_voting => (
	is => 'ro',
);

has logo => (
	is => 'ro',
);

has name => (
	is => 'ro',
);

has number_of_votes => (
	is => 'ro',
	default => 0,
);

has organizer => (
	is => 'ro',
);

has organizer_logo => (
	is => 'ro',
);

has person_roles => (
	is => 'ro',
);

has public_voting => (
	is => 'ro',
);

has sections => (
	default => [],
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check created_by.
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check dt_from
	check_required($self, 'dt_from');
	check_isa($self, 'dt_from', 'DateTime');

	# Check dt_to
	check_required($self, 'dt_to');
	check_isa($self, 'dt_to', 'DateTime');

	# Check id.
	check_number($self, 'id');

	# Check maximal number for jury marking.
	check_number($self, 'jury_max_marking_number');
	if (defined $self->{'jury_max_marking_number'}
		&& $self->{'jury_max_marking_number'} < 1) {

		err "Parameter 'jury_max_marking_number' must be a positive number.";
	}

	# Check jury voting.
	if (! defined $self->{'jury_voting'}) {
		$self->{'jury_voting'} = 0;
	}
	check_bool($self, 'jury_voting');

	# Check logo.
	check_length($self, 'logo', 255);

	# Check name
	check_required($self, 'name');
	check_length($self, 'name', 255);

	# Check number of votes.
	check_number($self, 'number_of_votes');

	# Check organizer.
	check_length($self, 'organizer', 255);

	# Check organizer logo.
	check_length($self, 'organizer_logo', 255);

	# Check person roles.
	check_array_object($self, 'person_roles', 'Data::Commons::Vote::PersonRole', 'PersonRole');

	# Check public voting flag.
	if (! defined $self->{'public_voting'}) {
		$self->{'public_voting'} = 0;
	}
	check_bool($self, 'public_voting');

	# Check sections.
	check_array_object($self, 'sections', 'Data::Commons::Vote::Section', 'Section');

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Data::Commons::Vote::Competition - Data object for commons.vote competition.

=head1 SYNOPSIS

 use Data::Commons::Vote::Competition;

 my $obj = Data::Commons::Vote::Competition->new(%params);
 my $dt_from = $obj->dt_from;
 my $dt_to = $obj->dt_to;
 my $id = $obj->id;
 my $jury_max_marking_number = $obj->jury_max_marking_number;
 my $jury_voting = $obj->jury_voting;
 my $logo = $obj->logo;
 my $name = $obj->name;
 my $number_of_votes = $obj->number_of_votes;
 my $organizer = $obj->organizer;
 my $organizer_logo = $obj->organizer_logo;
 my $public_voting = $obj->public_voting;
 my $sections_ar = $obj->sections;

=head1 METHODS

=head2 C<new>

 my $obj = Data::Commons::Vote::Competition->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<dt_from>

Competition date from.
It is DateTime instance.
It's required.

=item * C<dt_to>

Competition date to.
It is DateTime instance.
It's required.

=item * C<id>

Id of competition.
It's number.
It's optional.
Default value is undef.

=item * C<jury_max_marking_number>

Maximal number for jury marking.
It's positive number.
It's optional.
Default value is undef.

=item * C<jury_voting>

Jury voting flag.
It's bool.
Default value is 0.

=item * C<logo>

Competition logo.
Logo is file name in Wikimedia Commons.
Length of logo file is 255.
It's optional.
Default value is undef.

=item * C<name>

Name of competition.
Length of name is 255.
It's required.

=item * C<number_of_votes>

Number of votes in competition.
It's number.
It's optional.
Default value is undef.

=item * C<organizer>

Organizer name.
Length of name is 255.
It's optional.
Default value is undef.

=item * C<organizer_logo>

Organizer logo.
Length of logo file is 255.
It's optional.
Default value is undef.

=item * C<public_voting>

Public voting flag.
It's bool.
Default value is 0.

=item * C<sections>

List of competition sections.
Item must be a Data::Commons::Vote::Section object.
It's optional.
Default value is [].

=back

=head2 C<dt_to>

 my $dt_from = $obj->dt_from;

Get begin date of competition.

Returns DateTime object.

=head2 C<dt_to>

 my $dt_to = $obj->dt_to;

Get end date of competition.

Returns DateTime object.

=head2 C<id>

 my $id = $obj->id;

Get competition id.

Returns number.

=head2 C<jury_max_marking_number>

 my $jury_max_marking_number = $obj->jury_max_marking_number;

Get maximal number for jury marking.

Returns number.

=head2 C<jury_voting>

 my $jury_voting = $obj->jury_voting;

Get jury voting flag.

Returns bool.

=head2 C<logo>

 my $logo = $obj->logo;

Get competition logo file name in Wikimedia Commons.

Returns string.

=head2 C<name>

 my $name = $obj->name;

Get competition name.

Returns string.

=head2 C<number_of_votes>

 my $number_of_votes = $obj->number_of_votes;

Get number of votes.

Returns number.

=head2 C<organizer>

 my $organizer = $obj->organizer;

Get organizer name.

Returns string.

=head2 C<organizer_logo>

 my $organizer_logo = $obj->organizer_logo;

Get organizer logo file name in Wikimedia Commons.

=head2 C<public_voting>

 my $public_voting = $obj->public_voting;

Get public voting flag.

Returns bool.

=head2 C<sections>

 my $sections_ar = $obj->sections;

Get competition sections.

Returns reference to array with Data::Commons::Vote::Section instances.

=head1 ERRORS

 new():
         Parameter 'dt_from' is required.
         Parameter 'dt_from' must be a 'DateTime' object.
                 Value: %s
                 Reference: %s
         Parameter 'dt_to' is required.
         Parameter 'dt_to' must be a 'DateTime' object.
                 Value: %s
                 Reference: %s
         Parameter 'id' must a number.
                 Value: %s
         Parameter 'jury_max_marking_number' must a number.
                 Value: %s
         Parameter 'jury_max_marking_number' must be a positive number.
         Parameter 'jury_voting' is required.
         Parameter 'jury_voting' must be a bool (0/1).
                 Value: %s
         Parameter 'logo' has length greater than '255'.
                 Value: %s
         Parameter 'name' is required.
         Parameter 'name' has length greater than '255'.
                 Value: %s
         Parameter 'number_of_votes' must a number.
                 Value: %s
         Parameter 'organizer' has length greater than '255'.
                 Value: %s
         Parameter 'organizer_logo' has length greater than '255'.
                 Value: %s
         Parameter 'public_voting' is required.
         Parameter 'public_voting' must be a bool (0/1).
                 Value: %s
         Parameter 'sections' must be a array.
         Section isn't 'Data::Commons::Vote::Section' object.

=head1 EXAMPLE

=for comment filename=create_and_print_competition.pl

 use strict;
 use warnings;

 use Data::Commons::Vote::Competition;
 use DateTime;

 my $obj = Data::Commons::Vote::Competition->new(
         'dt_from' => DateTime->new(
                 'day' => 10,
                 'month' => 7,
                 'year' => 2022,
         ),
         'dt_to' => DateTime->new(
                 'day' => 20,
                 'month' => 7,
                 'year' => 2022,
         ),
         'id' => 1,
         'jury_max_marking_number' => 5,
         'jury_voting' => 1,
         'name' => 'Competition',
         'public_voting' => 1,
 );

 # Print out.
 print 'Id: '.$obj->id."\n";
 print 'Name: '.$obj->name."\n";
 print 'Date from: '.$obj->dt_from."\n";
 print 'Date to: '.$obj->dt_to."\n";
 print 'Jury voting: '.$obj->jury_voting."\n";
 print 'Maximum number fo jury marking: '.$obj->jury_max_marking_number."\n";
 print 'Public voting: '.$obj->public_voting."\n";
 print 'Number of votes: '.$obj->number_of_votes."\n";

 # Output:
 # Id: 1
 # Name: Competition
 # Date from: 2022-07-10T00:00:00
 # Date to: 2022-07-20T00:00:00
 # Jury voting: 1
 # Maximum number fo jury marking: 5
 # Public voting: 1
 # Number of votes: 0

=head1 DEPENDENCIES

L<Error::Pure>,
L<Mo>,
L<Mo::utils>.

=head1 REPOSITORY

L<https://github.com/commons-vote/Data-Commons-Vote>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2021-2022 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
