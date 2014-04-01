use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use Scalar::Util qw( looks_like_number );
use Test::More tests => 15;
use CLDR::Transform;

my $trans = new_ok 'CLDR::Transform', [
    source => 'Hiragana',
    target => 'Katakana',
], 'CLDR::Transform';

can_ok $trans, qw( source target variant transform version cldr_version );

is $trans->source, 'Hiragana', 'source set on instantiation';
is $trans->target, 'Katakana', 'target set on instantiation';

is $trans->transform('xxx'), 'xxx', 'transform method pass-through';
is $trans->transform(''),    '',    'transform method empty string';
is $trans->transform(),      undef, 'transform method undef';

ok looks_like_number($trans->version),      'version is numeric';
ok looks_like_number($trans->cldr_version), 'cldr_version is numeric';

$trans = new_ok 'CLDR::Transform';

is $trans->source,  'Any', 'default source';
is $trans->target,  'Any', 'default target';
is $trans->variant, undef, 'default variant';

$trans->source('Hiragana');
$trans->target('Katakana');

is $trans->source, 'Hiragana', 'source set via method';
is $trans->target, 'Katakana', 'target set via method';
