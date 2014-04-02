package CLDR::Transform;

use v5.8.1;
use utf8;
use charnames qw( :full );
use Unicode::Normalize qw( NFKC );

use Moo;
use namespace::clean;

our $VERSION      = '0.00_1';
our $CLDR_VERSION = '25';

has source => (
    is      => 'rw',
    default => 'Any',
);

has target => (
    is      => 'rw',
    default => 'Any',
);

has variant => (
    is => 'rw',
);

my %transform = (
    Hiragana => { Katakana => sub {
        my $text = shift;

        $text =~ s{
            ( [\N{NULL}-~、。\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}-゜ァ-ー｡-ﾟー\p{Hira}\p{Kana}\p{Mn}]+ )
        }{
            my $filter = NFKC($1);

            for ($filter) {
                s{わ\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}}{ヷ}g;
                s{ゐ\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}}{ヸ}g;
                s{ゑ\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}}{ヹ}g;
                s{を\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}}{ヺ}g;
                tr{ぁ-ゔゝゞ}{ァ-ヴヽヾ};
            }

            return $filter;
        }xeg;

        return $text;
    } },
    Katakana => { Hiragana => sub {
        my $text = shift;

        $text =~ s{
            ( [\N{NULL}-~、。\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}-゜ァ-ー｡-ﾟー\p{Hira}\p{Kana}\p{Mn}]+ )
        }{
            my $filter = NFKC($1);

            for ($filter) {
                s{ヷ}{わ\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}}g;
                s{ヸ}{ゐ\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}}g;
                s{ヹ}{ゑ\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}}g;
                s{ヺ}{を\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}}g;
                tr{ァ-ヴヽヾヵヶ}{ぁ-ゔゝゞかけ};
                s{ (?<= [ぁあかがさざただなはばぱまゃやらゎわ] ) ー }{あ}xg;
                s{ (?<= [ぃいきぎしじちぢにひびぴみりゐ]       ) ー }{い}xg;
                s{ (?<= [ぅうくぐすずっつづぬふぶぷむゅゆるゔ] ) ー }{う}xg;
                s{ (?<= [ぇえけげせぜてでねへべぺめれゑ]       ) ー }{え}xg;
                s{ (?<= [ぉおこごそぞとどのほぼぽもょよろを]   ) ー }{お}xg;
            }

            return $filter;
        }xeg;

        return $text;
    } },
);

sub transform {
    my ($self, $text) = @_;

    return undef
        if !defined $text
        || !exists $transform{$self->source}
        || !exists $transform{$self->source}{$self->target};

    $text = $transform{$self->source}{$self->target}($text);

    return $text;
}

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
