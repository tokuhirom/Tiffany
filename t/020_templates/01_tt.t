use strict;
use warnings;
use Test::Requires 'Template';
use Test::More;
use Tfall;

{
    my $tmpl = Tfall->new('t/tmpl/foo.tt');
    is $tmpl->render({name => 'john'}), "Hello, john.\n";
}
{
    eval {
        my $tmpl = Tfall->new('t/tmpl/unknown.tt');
        is $tmpl->render({name => 'john'}), undef;
    };
    ok $@;
}

{
    my $tmpl = Tfall::TT->new();
    is $tmpl->render('t/tmpl/foo.tt', {name => 'john'}), "Hello, john.\n";
}

{
    my $tmpl = Tfall::TT->new();
    is $tmpl->render(\"Hello, [% name %].", {name => 'john'}), "Hello, john.";
}

done_testing;

