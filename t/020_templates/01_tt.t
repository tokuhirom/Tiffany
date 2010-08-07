use strict;
use warnings;
use Test::Requires 'Template';
use Test::More;
use Tfall;
use Tfall::TT;

{
    eval {
        my $tmpl = Tfall::TT->new();
        $tmpl->render('t/tmpl/unknown.tt', {name => 'john'});
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

