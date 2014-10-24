package Catalyst::Plugin::Email;

use strict;
require Email::Send;

our $VERSION = '0.01';

=head1 NAME

Catalyst::Plugin::Email - Send emails with Catalyst

=head1 SYNOPSIS

    use Catalyst 'Email';
    use Email::Simple;
    use Email::Simple::Creator;

    __PACKAGE__->config->{email} = qw/SMTP smtp.oook.de/;

    $c->email(
        Email::Simple->create(
            header => [
                From    => 'sri@oook.de',
                To      => 'sri@cpan.org',
                Subject => 'Hello!'
            ],
            body => 'Hello sri'
        )
    );

=head1 DESCRIPTION

Send emails with Catalyst and C<Email::Send>.

=head2 METHODS

=head3 email

=cut

sub email {
    my ( $c, $email ) = @_;
    my @args = $c->config->{email};
    my $class;
    unless ( $class = shift @args ) {
        $class = 'SMTP';
        unshift @args, 'localhost';
    }
    Email::Send::send $class => $email, @args;
}

=head1 SEE ALSO

L<Catalyst>.

=head1 AUTHOR

Sebastian Riedel, C<sri@cpan.org>

=head1 COPYRIGHT

This program is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut

1;
