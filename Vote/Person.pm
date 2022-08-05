package Data::Commons::Vote::Person;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_length check_number);

our $VERSION = 0.01;

has first_upload_at => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has name => (
	is => 'ro',
);

has wm_username => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check first_upload_at.
	check_isa($self, 'first_upload_at', 'DateTime');

	# Check id.
	check_number($self, 'id');

	# Check author.
	check_length($self, 'name', 255);

	# Check wikimedia username.
	check_length($self, 'wm_username', 255);

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Data::Commons::Vote::Person - Data object for commons.vote person.

=head1 SYNOPSIS

 use Data::Commons::Vote::Person;

 my $obj = Data::Commons::Vote::Person->new(%params);
 my $first_upload_at = $obj->first_upload_at;
 my $id = $obj->id;
 my $name = $obj->name;
 my $wm_username = $obj->wm_username;

=head1 METHODS

=head2 C<new>

 my $obj = Data::Commons::Vote::Person->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<first_upload_at>

Competition date from.
First upload datetime to Wikimedia Commons.
It is DateTime instance.
It's optional.

=item * C<id>

Id of person.
It's number.
It's optional.
Default value is undef.

=item * C<name>

Name of person.
Length of name is 255.
It's optional.

=item * C<wm_username>

Wikimedia username.
It's optional.
Default value is undef.

=back

=head2 C<first_upload_at>

 my $first_upload_at = $obj->first_upload_at;

Get date of first upload to Wikimedia Commons.

Returns DateTime object.

=head2 C<id>

 my $id = $obj->id;

Get person id.

Returns number.

=head2 C<name>

 my $name = $obj->name;

Get person name.

Returns string.

=head2 C<wm_username>

 my $wm_username = $obj->wm_username;

Get person Wikimedia username.

Returns string.

=head1 ERRORS

 new():
         Parameter 'first_upload_at' must be a 'DateTime' object.
                 Value: %s
                 Reference: %s
         Parameter 'id' must a number.
                 Value: %s
         Parameter 'name' has length greater than '255'.
                 Value: %s
         Parameter 'wm_username' has length greater than '255'.
                 Value: %s

=head1 EXAMPLE

=for comment filename=create_and_print_person.pl

 use strict;
 use warnings;

 use Data::Commons::Vote::Person;
 use DateTime;
 use Unicode::UTF8 qw(decode_utf8 encode_utf8);

 my $obj = Data::Commons::Vote::Person->new(
         'first_upload_at' => DateTime->new(
                 'day' => 18,
                 'month' => 7,
                 'year' => 2009,
                 'hour' => 21,
                 'minute' => 5,
         ),
         'id' => 1,
         'name' => decode_utf8('Michal Josef Špaček'),
         'wm_username' => 'Skim',
 );

 # Print out.
 print 'Id: '.$obj->id."\n";
 print 'Name: '.encode_utf8($obj->name)."\n";
 print 'First upload to Wikimedia Commons: '.$obj->first_upload_at."\n";
 print 'Wikimedia username: '.$obj->wm_username."\n";

 # Output:
 # Id: 1
 # Name: Michal Josef Špaček
 # First upload to Wikimedia Commons: 2009-07-18T21:05:00
 # Wikimedia username: Skim

=head1 DEPENDENCIES

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
