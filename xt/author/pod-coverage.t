use utf8;
use strict;
use warnings;
use Test::More;

eval 'use Test::Pod::Coverage 1.00';
plan skip_all => 'Test::Pod::Coverage 1.00 not installed; skipping' if $@;

eval 'require Pod::Coverage::Moose';
plan skip_all => 'Pod::Coverage::Moose not installed; skipping' if $@;

all_pod_coverage_ok({ coverage_class => 'Pod::Coverage::Moose' });

done_testing();
