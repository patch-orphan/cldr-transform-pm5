![Perl CLDR](https://www.gravatar.com/avatar/656f15a25eff4437f5a82e7c929f41dd?s=96)

[![Build status](https://travis-ci.org/perl-cldr/cldr-transform-pm5.png)](https://travis-ci.org/perl-cldr/cldr-transform-pm5)
[![Coverage status](https://coveralls.io/repos/perl-cldr/cldr-transform-pm5/badge.png)](https://coveralls.io/r/perl-cldr/cldr-transform-pm5)
[![CPAN version](https://badge.fury.io/pl/CLDR-Transform.png)](http://badge.fury.io/pl/CLDR-Transform)

# NAME

CLDR::Transform - Unicode CLDR transformations, transliterations, and transcriptions

# VERSION

This document describes CLDR::Transform v0.00\_1, built with Unicode CLDR v25.

# SYNOPSIS

```perl
use CLDR::Transform;

$trans = CLDR::Transform->new(
    source => 'Hiragana',
    target => 'Katakana',
);

$katakana = $trans->transform($hiragana);
```

# DESCRIPTION

Unicode CLDR transformations, transliterations, and transcriptions.

## Attributes

- source
- target
- variant

## Methods

- transform

# SEE ALSO

- [Transforms in UTS #35](http://www.unicode.org/reports/tr35/tr35-general.html#Transforms)

# AUTHOR

Nick Patch <patch@cpan.org>

This project is brought to you by [Perl CLDR](http://perl-cldr.github.io/) and
[Shutterstock](http://www.shutterstock.com/). Additional open source projects
from Shutterstock can be found at
[code.shutterstock.com](http://code.shutterstock.com/).

# COPYRIGHT AND LICENSE

© 2014 Shutterstock, Inc.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
