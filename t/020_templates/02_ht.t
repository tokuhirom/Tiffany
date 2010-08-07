use strict;
use warnings;
use Test::Requires 'HTML::Template';
use Test::More;
use Tfall;
use Tfall::HTML::Template;

Tfall->register('ht', 'Tfall::HTML::Template');

{
    my $tmpl = Tfall->new('t/tmpl/foo.ht');
    is $tmpl->render({name => 'john'}), "Hello, john.\n";
}
{
    eval {
        my $tmpl = Tfall->new('t/tmpl/unknown.ht');
        is $tmpl->render({name => 'john'}), undef;
    };
    ok $@;
}

{
    my $tmpl = Tfall::HTML::Template->new();
    is $tmpl->render('t/tmpl/foo.ht', {name => 'john'}), "Hello, john.\n";
}
{
    my $tmpl = Tfall::HTML::Template->new();
    is $tmpl->render(\q{Hello, <TMPL_VAR NAME="name">.}, {name => 'john'}), "Hello, john.";
}

done_testing;

