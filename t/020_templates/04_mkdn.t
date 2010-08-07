use strict;
use warnings;
use Test::Requires 'Text::Markdown';
use Test::More;
use Tfall;
use Tfall::Text::Markdown;

Tfall->register('mkdn', 'Tfall::Text::Markdown');

{
    my $tmpl = Tfall->new('t/tmpl/foo.mkdn');
    is $tmpl->render('john'), "<p>Hello, john.</p>\n";
}
{
    eval {
        my $tmpl = Tfall->new('t/tmpl/unknown.mkdn');
        is $tmpl->render('john'), undef;
    };
    ok $@;
}

{
    my $tmpl = Tfall::Text::Markdown->new();
    is $tmpl->render('t/tmpl/foo.mkdn', 'john'), "<p>Hello, john.</p>\n";
}
{
    my $tmpl = Tfall::Text::Markdown->new();
    is $tmpl->render(\"Hello, john.", 'john'), "<p>Hello, john.</p>\n";
}

done_testing;

