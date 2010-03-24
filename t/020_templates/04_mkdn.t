use strict;
use warnings;
use Test::Requires 'Text::Markdown';
use Test::More;
use Tempa;
use Tempa::Text::Markdown;

Tempa->register('mkdn', 'Tempa::Text::Markdown');

{
    my $tmpl = Tempa->new('t/tmpl/foo.mkdn');
    is $tmpl->render('john'), "<p>Hello, john.</p>\n";
}
{
    my $tmpl = Tempa->new('t/tmpl/unknown.mkdn');
    is $tmpl->render('john'), undef;
    ok $tmpl->errstr();
}

{
    my $tmpl = Tempa::Text::Markdown->new('t/tmpl/foo.mkdn');
    is $tmpl->render('john'), "<p>Hello, john.</p>\n";
}

done_testing;

