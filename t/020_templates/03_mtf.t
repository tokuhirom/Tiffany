use strict;
use warnings;
use Test::Requires 'Text::MicroTemplate';
use Test::More;
use Tempa;
use Tempa::Text::MicroTemplate::File;

Tempa->register('mt', 'Tempa::Text::MicroTemplate::File');

{
    my $tmpl = Tempa->new('t/tmpl/foo.mt');
    is $tmpl->render('john'), "hello, john.\n";
}
{
    my $tmpl = Tempa->new('t/tmpl/unknown.mt');
    is $tmpl->render('john'), undef;
    ok $tmpl->errstr();
}

{
    my $tmpl = Tempa::Text::MicroTemplate::File->new('t/tmpl/foo.mt');
    is $tmpl->render('john'), "hello, john.\n";
}
{
    my $tmpl = Tempa::Text::MicroTemplate::File->new(\'hello, <?= $_[0] ?>.', 'john');
    is $tmpl->render('john'), "hello, john.";
}

done_testing;

