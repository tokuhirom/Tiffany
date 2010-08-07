use strict;
use warnings;
use Test::Requires 'Text::MicroTemplate';
use Test::More;
use Tfall;
use Tfall::Text::MicroTemplate::File;

Tfall->register('mt', 'Tfall::Text::MicroTemplate::File');

{
    my $tmpl = Tfall->new('t/tmpl/foo.mt');
    is $tmpl->render('john'), "hello, john.\n";
}
{
    eval {
        my $tmpl = Tfall->new('t/tmpl/unknown.mt');
        is $tmpl->render('john'), undef;
    };
    ok $@;
}

{
    my $tmpl = Tfall::Text::MicroTemplate::File->new();
    is $tmpl->render('t/tmpl/foo.mt', 'john'), "hello, john.\n";
}
{
    my $tmpl = Tfall::Text::MicroTemplate::File->new();
    is $tmpl->render(\'hello, <?= $_[0] ?>.', 'john'), "hello, john.";
}

done_testing;

