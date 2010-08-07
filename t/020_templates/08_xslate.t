use strict;
use warnings;
use Test::Requires 'Text::Xslate';
use Test::More;
use Tfall::Text::Xslate;

{
    my $tmpl = Tfall::Text::Xslate->new();
    is $tmpl->render('t/tmpl/foo.tx', {name => 'john'}), "Hello, john.\n";
}

{
    my $tmpl = Tfall::Text::Xslate->new();
    is $tmpl->render(\'Hello, <: $name :>.', {name => 'john'}), "Hello, john.";
}
{
    my $tmpl = Tfall::Text::Xslate->new(syntax => 'TTerse');
    is $tmpl->render(\'Hello, [% name %].', {name => 'john'}), "Hello, john.";
}
{
    eval {
        my $tmpl = Tfall::Text::Xslate->new();
        is $tmpl->render('unknown.tx', {name => 'john'}), "Hello, john.";
    };
    ok $@;
}

done_testing;

