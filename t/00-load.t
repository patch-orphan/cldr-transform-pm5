use utf8;
use strict;
use warnings;
use English;
use Test::More tests => 1;

BEGIN {
    use_ok 'CLDR::Transform';
}

diag join ', ' => (
    "CLDR::Transform v$CLDR::Transform::VERSION",
    "Moo v$Moo::VERSION",
    "Perl $PERL_VERSION ($EXECUTABLE_NAME)",
);
