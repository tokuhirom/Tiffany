use strict;
use warnings;
use Test::Requires 'Template';
use Test::More;
use Tempa;
use Tempa::TT;

Tempa->register('tt', 'Tempa::TT');

{
    my $tmpl = Tempa->new('t/tmpl/foo.tt');
    is $tmpl->render({name => 'john'}), "Hello, john.\n";
}
{
    my $tmpl = Tempa->new('t/tmpl/unknown.tt');
    is $tmpl->render({name => 'john'}), undef;
    ok $tmpl->errstr();
}

{
    my $tmpl = Tempa::TT->new('t/tmpl/foo.tt');
    is $tmpl->render({name => 'john'}), "Hello, john.\n";
}

done_testing;

