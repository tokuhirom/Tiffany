use strict;
use warnings;
use Test::Requires 'Text::Markdown';
use Test::More;
use Tfall;
use Tfall::Text::Markdown;

{
    eval {
        my $tmpl = Tfall::Text::Markdown->new();
        $tmpl->render('t/tmpl/unknown.mkdn', 'john');
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

