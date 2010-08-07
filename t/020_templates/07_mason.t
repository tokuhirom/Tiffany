use strict;
use warnings;
use Test::Requires 'Text::MicroMason';
use Test::More;
use Tfall;

{
    my $tmpl = Tfall->new('t/tmpl/foo.mason');
    is $tmpl->render(name => 'john'), "Hello, john\n";
}
{
    eval {
        my $tmpl = Tfall->new('t/tmpl/unknown.mason');
        is $tmpl->render(name => 'john'), undef;
    };
    ok $@;
}

{
    my $tmpl = Tfall::Text::MicroMason->new();
    is $tmpl->render('t/tmpl/foo.mason', name => 'john'), "Hello, john\n";
}
{
    my $tmpl = Tfall::Text::MicroMason->new();
    my $t = \<<'...';
<%args>
    $name
</%args>
Hello, <% $name %>
...
    is $tmpl->render($t, name => 'john'), "Hello, john\n";
}

done_testing;

