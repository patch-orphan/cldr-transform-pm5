use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use Test::More tests => 10;
use CLDR::Transform;

my $trans = new_ok 'CLDR::Transform', [
    source => 'Hiragana',
    target => 'Katakana',
], 'CLDR::Transform';

can_ok $trans, qw( source target variant transform );

is $trans->source, 'Hiragana', 'source set on instantiation';
is $trans->target, 'Katakana', 'target set on instantiation';

$trans = new_ok 'CLDR::Transform';

is $trans->source,  'Any', 'default source';
is $trans->target,  'Any', 'default target';
is $trans->variant, undef, 'default variant';

$trans->source('Hiragana');
$trans->target('Katakana');

is $trans->source, 'Hiragana', 'source set via method';
is $trans->target, 'Katakana', 'target set via method';
