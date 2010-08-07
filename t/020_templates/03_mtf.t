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
    my $tmpl = Tfall->new('t/tmpl/unknown.mt');
    is $tmpl->render('john'), undef;
    ok $tmpl->errstr();
}

{
    my $tmpl = Tfall::Text::MicroTemplate::File->new('t/tmpl/foo.mt');
    is $tmpl->render('john'), "hello, john.\n";
}
{
    my $tmpl = Tfall::Text::MicroTemplate::File->new(\'hello, <?= $_[0] ?>.');
    is $tmpl->render('john'), "hello, john.";
}

done_testing;

