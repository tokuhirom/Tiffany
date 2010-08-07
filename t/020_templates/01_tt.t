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
    my $tmpl = Tfall->new('t/tmpl/unknown.tt');
    is $tmpl->render({name => 'john'}), undef;
    ok $tmpl->errstr();
}

{
    my $tmpl = Tfall::TT->new('t/tmpl/foo.tt');
    is $tmpl->render({name => 'john'}), "Hello, john.\n";
}

{
    my $tmpl = Tfall::TT->new(\"Hello, [% name %].");
    is $tmpl->render({name => 'john'}), "Hello, john.";
}

done_testing;

