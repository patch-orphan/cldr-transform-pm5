use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use charnames qw( :full );
use Test::More tests => 3;
use CLDR::Transform;

my $h2k = CLDR::Transform->new(source => 'Hiragana', target => 'Katakana');
my $k2h = CLDR::Transform->new(source => 'Katakana', target => 'Hiragana');

my $h = "あゐ\N{COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK}をぐ";
my $k = 'アヸヲグ';

is $h2k->transform($h), $k, 'Hiragana to Katakana (round-trip)';
is $k2h->transform($k), $h, 'Katakana to Hiragana (round-trip)';

is $k2h->transform('ボヶダーンー'),
                   'ぼけだあんー', 'Katakana to Hiragana (one-way)';
