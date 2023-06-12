package Data::Commons::Vote::Competition;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build default is);
use Mo::utils qw(check_array_object check_bool check_isa check_length
	check_number check_required);

our $VERSION = 0.01;

has created_by => (
	is => 'ro',
);

has dt_images_loaded => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has logo => (
	is => 'ro',
);

has name => (
	is => 'ro',
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

has person_roles => (
	default => [],
	is => 'ro',
);

has sections => (
	default => [],
	is => 'ro',
);

has validations => (
	default => [],
	is => 'ro',
);

has voting_types => (
	default => [],
	is => 'ro',
);

has wd_qid => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check created_by.
	check_required($self, 'created_by');
	check_isa($self, 'created_by', 'Data::Commons::Vote::Person');

	# Check dt_images_loaded.
	check_isa($self, 'dt_images_loaded', 'DateTime');

	# Check id.
	check_number($self, 'id');

	# Check logo.
	check_length($self, 'logo', 255);

	# Check name
	check_required($self, 'name');
	check_length($self, 'name', 255);

	# Check organizer.
	check_length($self, 'organizer', 255);

	# Check organizer logo.
	check_length($self, 'organizer_logo', 255);

	# Check person roles.
	check_array_object($self, 'person_roles', 'Data::Commons::Vote::PersonRole', 'PersonRole');

	# Check person_roles.
	check_array_object($self, 'person_roles', 'Data::Commons::Vote::PersonRole', 'PersonRole');

	# Check sections.
	check_array_object($self, 'sections', 'Data::Commons::Vote::Section', 'Section');

	# Check validations.
	check_array_object($self, 'validations', 'Data::Commons::Vote::CompetitionValidation', 'CompetitionValidation');

	# Check voting types.
	check_array_object($self, 'voting_types', 'Data::Commons::Vote::CompetitionVoting', 'CompetitionVoting');

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
 my $created_by = $obj->created_by;
 my $dt_images_loaded = $obj->dt_images_loaded;
 my $id = $obj->id;
 my $logo = $obj->logo;
 my $name = $obj->name;
 my $organizer = $obj->organizer;
 my $organizer_logo = $obj->organizer_logo;
 my $sections_ar = $obj->sections;
 my $validations_ar = $obj->validations;
 my $voting_types_ar = $obj->voting_types;
 my $wd_qid = $obj->wd_qid;

=head1 METHODS

=head2 C<new>

 my $obj = Data::Commons::Vote::Competition->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<created_by>

Person, which created competition.
It's L<Data::Commons::Vote::Person> instance.
It's required.

=item * C<dt_images_loaded>

Datetime of situation when images loaded to database.
It is DateTime instance.
It's optional.

=item * C<id>

Id of competition.
It's number.
It's optional.
Default value is undef.

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

=item * C<sections>

List of competition sections.
Item must be a Data::Commons::Vote::Section object.
It's optional.
Default value is [].

=item * C<voting_types>

List of competition voting types.
Item must be a Data::Commons::Vote::CompetitionVoting object.
It's optional.
Default value is [].

=item * C<wd_qid>

Wikidata QID of competition.
It's optional.
Default value is undef.

=back

=head2 C<created_by>

 my $created_by = $obj->created_by;

Get person, which created competition.

Returns L<Data::Commons::vote::Person> object.

=head2 C<dt_images_loaded>

 my $dt_images_loaded = $obj->dt_images_loaded;

Get date time of situation when images were loaded.

Returns DateTime object.

=head2 C<id>

 my $id = $obj->id;

Get competition id.

Returns number.

=head2 C<logo>

 my $logo = $obj->logo;

Get competition logo file name in Wikimedia Commons.

Returns string.

=head2 C<name>

 my $name = $obj->name;

Get competition name.

Returns string.

=head2 C<organizer>

 my $organizer = $obj->organizer;

Get organizer name.

Returns string.

=head2 C<organizer_logo>

 my $organizer_logo = $obj->organizer_logo;

Get organizer logo file name in Wikimedia Commons.

=head2 C<sections>

 my $sections_ar = $obj->sections;

Get competition sections.

Returns reference to array with Data::Commons::Vote::Section instances.

=head2 C<voting_types>

 my $voting_types_ar = $obj->voting_types;

Get competition voting types.

Returns reference to array with L<Data::Commons::Vote::CompetitionVoting> instances.

=head2 C<wd_qid>

 my $wd_qid = $obj->wd_qid;

Get Wikidata QID for competition.

Returns string.

=head1 ERRORS

 new():
         CompetitionVoting isn't 'Data::Commons::Vote::CompetitionVoting' object.
         Parameter 'created_by' is required.
         Parameter 'created_by' must be a 'Data::Commons::Vote::Person' object.
                 Value: %s
                 Reference: %s
         Parameter 'dt_images_loaded' must be a 'DateTime' object.
                 Value: %s
                 Reference: %s
         Parameter 'id' must a number.
                 Value: %s
         Parameter 'logo' has length greater than '255'.
                 Value: %s
         Parameter 'name' is required.
         Parameter 'name' has length greater than '255'.
                 Value: %s
         Parameter 'organizer' has length greater than '255'.
                 Value: %s
         Parameter 'organizer_logo' has length greater than '255'.
                 Value: %s
         Parameter 'sections' must be a array.
         Parameter 'voting_types' must be a array.
         Section isn't 'Data::Commons::Vote::Section' object.

=head1 EXAMPLE

=for comment filename=create_and_print_competition.pl

 use strict;
 use warnings;

 use Data::Commons::Vote::Competition;
 use Data::Commons::Vote::Person;
 use DateTime;

 my $obj = Data::Commons::Vote::Competition->new(
         'created_by' => Data::Commons::Vote::Person->new(
                 'name' => 'Michal Josef Spacek',
         ),
         'id' => 1,
         'name' => 'Competition',
 );

 # Print out.
 print 'Id: '.$obj->id."\n";
 print 'Name: '.$obj->name."\n";

 # Output:
 # Id: 1
 # Name: Competition

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
