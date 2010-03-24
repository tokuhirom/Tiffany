use strict;
use warnings;
use Test::Requires 'HTML::Template';
use Test::More;
use Tempa;
use Tempa::HTML::Template;

Tempa->register('ht', 'Tempa::HTML::Template');

{
    my $tmpl = Tempa->new('t/tmpl/foo.ht');
    is $tmpl->render({name => 'john'}), "Hello, john.\n";
}
{
    my $tmpl = Tempa->new('t/tmpl/unknown.ht');
    is $tmpl->render({name => 'john'}), undef;
    ok $tmpl->errstr();
}

{
    my $tmpl = Tempa::HTML::Template->new('t/tmpl/foo.ht');
    is $tmpl->render({name => 'john'}), "Hello, john.\n";
}
{
    my $tmpl = Tempa::HTML::Template->new(\q{Hello, <TMPL_VAR NAME="name">.});
    is $tmpl->render({name => 'john'}), "Hello, john.";
}

done_testing;

