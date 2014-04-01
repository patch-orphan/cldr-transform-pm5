package CLDR::Number;

use v5.8.1;
use utf8;

use Moo;
use namespace::clean;

our $VERSION = '0.00_1';

1;

__END__

=encoding UTF-8

=head1 NAME

CLDR::Transform - Unicode CLDR transformations, transliterations, and transcriptions

=head1 VERSION

This document describes CLDR::Transform v0.00_1, built with Unicode CLDR v25.

=head1 SYNOPSIS

    use CLDR::Transform;

    $trans = CLDR::Transform->new(
        source => 'Hiragana',
        target => 'Katakana',
    );

    $katakana = $trans->transform($hiragana);

=head1 DESCRIPTION

Unicode CLDR transformations, transliterations, and transcriptions.

=head2 Attributes

=over

=item source

=item target

=item variant

=back

=head2 Methods

=over

=item transform

=back

=head1 SEE ALSO

=over

=item * L<Transforms in UTS #35|http://www.unicode.org/reports/tr35/tr35-general.html#Transforms>

=back

=head1 AUTHOR

Nick Patch <patch@cpan.org>

This project is brought to you by L<Perl CLDR|http://perl-cldr.github.io/> and
L<Shutterstock|http://www.shutterstock.com/>. Additional open source projects
from Shutterstock can be found at
L<code.shutterstock.com|http://code.shutterstock.com/>.

=head1 COPYRIGHT AND LICENSE

© 2014 Shutterstock, Inc.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
